import numpy as np


def zero_pad(image, pad_height, pad_width):
    """
    Zero-pad an image.

    Ex: a 1x1 image [[1]] with pad_height = 1, pad_width = 2 becomes:

        [[0, 0, 0, 0, 0],
         [0, 0, 1, 0, 0],
         [0, 0, 0, 0, 0]]         of shape (3, 5)

    Args:
        image: numpy array of shape (H, W)
        pad_width: width of the zero padding (left and right padding)
        pad_height: height of the zero padding (bottom and top padding)

    Returns:
        out: numpy array of shape (H+2*pad_height, W+2*pad_width)
    """

    H, W = image.shape[:2]
    if len(image.shape) == 2:
        # gray image
        out = np.zeros((H + 2 * pad_height, W + 2 * pad_width))
        out[pad_height: H + pad_height, pad_width: W + pad_width] = image
    else:
        # color image
        out = np.zeros((H + 2 * pad_height, W + 2 * pad_width, 3))
        out[pad_height: H + pad_height, pad_width: W + pad_width, :] = image

    return out

def filter2d(image, filter):

    out = None
    Hi, Wi = image.shape
    Hk, Wk = filter.shape
    out = np.zeros((Hi, Wi))

    image = zero_pad(image, Hk // 2, Wk // 2)
    for m in range(Hi):
        for n in range(Wi):
            ### YOUR CODE HERE (replace ??? with your code)
            out[m, n] = np.sum(image[m:m + Hk, n:n + Wk] * filter)
            ### END YOUR CODE

    return out
