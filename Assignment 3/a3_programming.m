pkg load image;


u = 5;
v = 5;
T = 1;
a = 0.1;
b = 0.1;
H = zeros(u, v);

% Create a uxv filter
for i = 1:u
  for j = 1:v
    if(i==1 && j ==1)
      H(i,j) = T;
     else
        H(i,j) = filter_func(T,a,b,i-1,j-1);
     endif
  endfor
endfor

I = imread('cameraman.tif');

% Apply filter function using conv2
motion = conv2(I, real(H), 'same') + 1i * conv2(I, imag(H), 'same');

% Plot
figure;
subplot(1, 2, 1), imshow(I), title('Original Image');
subplot(1, 2, 2), imshow(abs(motion), []), title('Motion Blur');

magnitudeImage = abs(H);

% Display the magnitude image
figure;
imshow(magnitudeImage, []);
title('Magnitude Image');



