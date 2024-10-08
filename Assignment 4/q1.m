pkg load image

image = imread('tools_noisy.png');

smoothedImage = imfilter(image, fspecial('average', [5, 5]));

[result] = otsu(image);
[resultSmooth] = otsu(smoothedImage);

figure;
subplot(2, 2, 1);
imshow(image);
title('Original Image');

subplot(2, 2, 2);
imshow(result);
title('Otsu method');

subplot(2, 2, 3);
imshow(smoothedImage);
title('Smoothed Image');

subplot(2, 2, 4);
imshow(resultSmooth);
title('Otsu method smoothed');



