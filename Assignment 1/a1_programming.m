pkg load image
pkg load statistics

%% 1
% Read the images
brain_mri = imread('brain-mri.png');
landscape = imread('landscape.png');

% 2
% Calculate histograms
H1 = zeros(1, 256);
for i = 1:length(H1)
  H1(i) = sum(sum(brain_mri == i - 1));
endfor

subplot(2,2,1);
plot(H1);
title('brain-mri');

H2 = zeros(1, 256);
for i = 1:length(H2)
  H2(i) = sum(sum(landscape == i - 1));
endfor

subplot(2,2,2);
plot(H2);
title('landscape');

% 3
% Calculate histograms using imhist
histo_brain_mri = imhist(brain_mri);
histo_landscape = imhist(landscape);

subplot(2,2,3);
plot(histo_brain_mri);
title('brain-mri (imhist)');

subplot(2,2,4);
plot(histo_landscape);
title('landscape (imhist)');

% The histograms used by my program look similar to the ones using imhist

% 4
% Calculate cumulative distribution function
cdf = cumsum(H1 / sum(H1));
% Perform equalization
equalized1 = cdf(double(brain_mri)+1);
% Round
equalized1 = uint8(equalized1 * 255);

cdf = cumsum(H2 / sum(H2));
equalized2 = cdf(double(landscape)+1);
equalized2 = uint8(equalized2 * 255);

figure;
subplot(2,2,1);
imshow(equalized1);
title('brain-mri');

subplot(2,2,2);
imshow(equalized2);
title('landscape');


% 5
% Histo Equalization using histeq
hist_eq_brain_mri = histeq(brain_mri);
hist_eq_landscape = histeq(landscape);

subplot(2,2,3);
imshow(hist_eq_brain_mri);
title('brain-mri (histeq)');

subplot(2,2,4);
imshow(hist_eq_landscape);
title('landscape (histeq)');

% The histogram-equalized images obtained using my program look similar to histeq

adaptthresh(brain_mri);
