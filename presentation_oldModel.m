originalImage = imread('lena.bmp'); 

temp = originalImage;
wavelet = 'haar';

[LL1,LH1,HL1,HH1] = dwt2(temp,wavelet);

% for Lena
symbols_LL = unique(LL1(:));
probabilities_LL = histcounts(LL1(:), [symbols_LL; inf]) / numel(LL1);
dict_LL = custom_huffmandict(symbols_LL, probabilities_LL);
encoded_LL = custom_huffmanenco(LL1(:), dict_LL);

symbols_LH = unique(LH1(:));
probabilities_LH = histcounts(LH1(:), [symbols_LH; inf]) / numel(LH1);
dict_LH = custom_huffmandict(symbols_LH, probabilities_LH);
encoded_LH = custom_huffmanenco(LH1(:), dict_LH);

symbols_HL = unique(HL1(:));
probabilities_HL = histcounts(HL1(:), [symbols_HL; inf]) / numel(HL1);
dict_HL = custom_huffmandict(symbols_HL, probabilities_HL);
encoded_HL = custom_huffmanenco(HL1(:), dict_HL);

symbols_HH = unique(HH1(:));
probabilities_HH = histcounts(HH1(:), [symbols_HH; inf]) / numel(HH1);
dict_HH = custom_huffmandict(symbols_HH, probabilities_HH);
encoded_HH = custom_huffmanenco(HH1(:), dict_HH);

% Save the binary sequence to a file
fid = fopen('encoded_Lena_LL.bin', 'wb');
fwrite(fid, encoded_LL, 'ubit1');
fclose(fid);

fid = fopen('encoded_Lena_LH.bin', 'wb');
fwrite(fid, encoded_LH, 'ubit1');
fclose(fid);

fid = fopen('encoded_Lena_HL.bin', 'wb');
fwrite(fid, encoded_HL, 'ubit1');
fclose(fid);

fid = fopen('encoded_Lena_HH.bin', 'wb');
fwrite(fid, encoded_HH, 'ubit1');
fclose(fid);


%%%%%%% decode part %%%%%%%


%Read the encoded binary sequence from the file
fid = fopen('encoded_Lena_LL.bin', 'rb');
encoded_LL = fread(fid, 'ubit1');
fclose(fid);

fid = fopen('encoded_Lena_LH.bin', 'rb');
encoded_LH = fread(fid, 'ubit1');
fclose(fid);

fid = fopen('encoded_Lena_HL.bin', 'rb');
encoded_HL = fread(fid, 'ubit1');
fclose(fid);

fid = fopen('encoded_Lena_HH.bin', 'rb');
encoded_HH = fread(fid, 'ubit1');
fclose(fid);

%Decode encoded sequence
decoded_LL = huffmandeco(encoded_LL, dict_LL);
decoded_LH = huffmandeco(encoded_LH, dict_LH);
decoded_HL = huffmandeco(encoded_HL, dict_HL);
decoded_HH = huffmandeco(encoded_HH, dict_HH);

%Reshape the decoded sequence
decoded_image_LL = reshape(decoded_LL, size(LL1));
decoded_image_LH = reshape(decoded_LH, size(LH1));
decoded_image_HL = reshape(decoded_HL, size(HL1));
decoded_image_HH = reshape(decoded_HH, size(HH1));

%Inverse DWT
reconstructed_image_old_model = idwt2(decoded_image_LL, decoded_image_LH, decoded_image_HL, decoded_image_HH, 'haar');

%Display image
figure;
subplot(1, 1, 1);
imshow(reconstructed_image_old_model, []);
title('Reconstructed Image from Old model');

reconstructed_uint8 = im2uint8(reconstructed_image_old_model);
imwrite(reconstructed_uint8, 'reconstructed_image_old_model.bmp');

