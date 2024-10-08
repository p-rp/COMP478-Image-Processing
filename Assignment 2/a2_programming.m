pkg load image  % Load the image package if not already loaded

% Read your grayscale image
grayImage = imread('Doc.tiff');

% Apply adaptive thresholding
thresholdedImage = im2bw(grayImage, graythresh(grayImage));

% Display the thresholded image
imshow(thresholdedImage);
