originalImage = imread('lena.bmp');
reconstructedImage = imread('reconstructed_image.bmp');

reconstructedImage = imresize(reconstructedImage, size(originalImage));

% originalImage = im2double(originalImage);
% reconstructedImage = im2double(reconstructedImage);

%MSE
mse = mean((originalImage(:) - reconstructedImage(:)).^2);

%maximum pixel value
max_intensity = max(originalImage(:));
maxPixelValue = 255;

%PSNR (Peak Signal-to-Noise Ratio)
psnr = 10 * log10((maxPixelValue^2) / mse);

fprintf('PSNR: %.2f dB\n', psnr);
