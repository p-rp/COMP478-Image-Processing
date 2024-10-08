import cv2
import matplotlib.pyplot as plt
import numpy as np
from scipy.ndimage import gaussian_filter


# Read images in gray scale
text = cv2.imread('text.png', cv2.IMREAD_GRAYSCALE)
H04 = cv2.imread('H04.bmp', cv2.IMREAD_GRAYSCALE)
Doc = cv2.imread('Doc.tiff', cv2.IMREAD_GRAYSCALE)

# Apply adaptive thresholding
def adaptive_thresholding(image, m, c):
    # Output image to store the thresholded result
    output_image = np.zeros_like(image)

    height, width = image.shape

    # Loop through  image
    for x in range(height):
        for y in range(width):
            # Calculate starting and ending indices for row and column based on given filter size (m)
            x1 = max(0, x - m // 2)
            x2 = min(height, x + m // 2)
            y1 = max(0, y - m // 2)
            y2 = min(width, y + m // 2)

            # Create filter with given size
            filter = image[x1:x2, y1:y2]

            # Weighted averaging filter (box filter)
            WA = np.mean(filter)

            # Calculate the threshold T(x, y)
            T = WA - c

            # Apply threshold transfer function
            output_image[x, y] = 255 if image[x, y] > T else 0

    return output_image


# Perform adaptive thresholding
at_text = adaptive_thresholding(text, 20, 6)
at_H04 = adaptive_thresholding(H04, 25, 25)
at_Doc = adaptive_thresholding(Doc, 8, 3)

cv2.imshow('Adaptive Thresholding Result', at_Doc)
cv2.waitKey(0)
cv2.destroyAllWindows()

# Plot
# plt.subplot(2, 3, 1)
# plt.imshow(at_text, cmap=plt.cm.gray)
# plt.title('Text')
# plt.axis('off')
#
# plt.subplot(2, 3, 2)
# plt.imshow(at_H04, cmap=plt.cm.gray)
# plt.title('H04')
# plt.axis('off')
#
# plt.subplot(2, 3, 3)
# plt.imshow(at_Doc, cmap=plt.cm.gray)
# plt.title('Doc')
# plt.axis('off')

## Compare results with adaptthresh() function (from OpenCV)
# Perform adaptive thresholding (using adaptthresh equivalent)
adaptthresh_text = cv2.adaptiveThreshold(text, 255, cv2.ADAPTIVE_THRESH_MEAN_C, cv2.THRESH_BINARY, 199, 5)
adaptthresh_H04 = cv2.adaptiveThreshold(H04, 255, cv2.ADAPTIVE_THRESH_MEAN_C, cv2.THRESH_BINARY, 199, 5)
adaptthresh_Doc = cv2.adaptiveThreshold(Doc, 255, cv2.ADAPTIVE_THRESH_MEAN_C, cv2.THRESH_BINARY, 199, 5)

# Plot
# plt.subplot(2, 3, 4)
# plt.imshow(adaptthresh_text, cmap=plt.cm.gray)
# plt.title('Text (adaptthresh)')
# plt.axis('off')
#
# plt.subplot(2, 3, 5)
# plt.imshow(adaptthresh_H04, cmap=plt.cm.gray)
# plt.title('H04 (adaptthresh)')
# plt.axis('off')
#
# plt.subplot(2, 3, 6)
# plt.imshow(adaptthresh_Doc, cmap=plt.cm.gray)
# plt.title('Doc (adaptthresh)')
# plt.axis('off')
#
# plt.show()

# I used a box filter, because it was not necessary to use something like Gaussian to remove noise and make it smoother,
# but rather have more accurate filter to have clear and readable text.

# When I applied adaptive thresholding, the images had way less shadows and stains, compared to using adaptiveThreshold
# from OpenCV, even after tweaking with the parameters. I also used mean filter in both cases to keep it consistent.
