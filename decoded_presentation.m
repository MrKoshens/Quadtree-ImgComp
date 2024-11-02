fid_LL = fopen('encoded_quadtree_LL.bin', 'rb');
encoded_quadtree_LL = fread(fid_LL, 'ubit1');
fclose(fid_LL);

fid_LH = fopen('encoded_quadtree_LH.bin', 'rb');
encoded_quadtree_LH = fread(fid_LH, 'ubit1');
fclose(fid_LH);

fid_HL = fopen('encoded_quadtree_HL.bin', 'rb');
encoded_quadtree_HL = fread(fid_HL, 'ubit1');
fclose(fid_HL);

fid_HH = fopen('encoded_quadtree_HH.bin', 'rb');
encoded_quadtree_HH = fread(fid_HH, 'ubit1');
fclose(fid_HH);

decoded_quadtree_LL = huffmandeco(encoded_quadtree_LL, dict_LL);
decoded_quadtree_LH = huffmandeco(encoded_quadtree_LH, dict_LH);
decoded_quadtree_HL = huffmandeco(encoded_quadtree_HL, dict_HL);
decoded_quadtree_HH = huffmandeco(encoded_quadtree_HH, dict_HH);

thresh = 127; 
quadtree_LL1 = qtgetblk(decoded_quadtree_LL, minDim, thresh);
quadtree_LH1 = qtgetblk(decoded_quadtree_LH, minDim, thresh);
quadtree_HL1 = qtgetblk(decoded_quadtree_HL, minDim, thresh);
quadtree_HH1 = qtgetblk(decoded_quadtree_HH, minDim, thresh);

Reconstructed_LL1 = zeros(size(LL1));
Reconstructed_LH1 = zeros(size(LH1));
Reconstructed_HL1 = zeros(size(HL1));
Reconstructed_HH1 = zeros(size(HH1));

[row_LL, col_LL] = find(quadtree_LL1);
for i = 1:length(row_LL)
    Reconstructed_LL1(row_LL(i):row_LL(i)+minDim-1, col_LL(i):col_LL(i)+minDim-1) = 1; 
end

[row_LH, col_LH] = find(quadtree_LH1);
for i = 1:length(row_LH)
    Reconstructed_LH1(row_LH(i):row_LH(i)+minDim-1, col_LH(i):col_LH(i)+minDim-1) = 1; 
end

[row_HL, col_HL] = find(quadtree_HL1);
for i = 1:length(row_HL)
    Reconstructed_HL1(row_HL(i):row_HL(i)+minDim-1, col_HL(i):col_HL(i)+minDim-1) = 1; 
end

[row_HH, col_HH] = find(quadtree_HH1);
for i = 1:length(row_HH)
    Reconstructed_HH1(row_HH(i):row_HH(i)+minDim-1, col_HH(i):col_HH(i)+minDim-1) = 1; 
end

[reconstructed_LL1, reconstructed_LH1, reconstructed_HL1, reconstructed_HH1] = deal(LL1, LH1, HL1, HH1);
reconstructed_image = idwt2(LL1, LH1, HL1, HH1, 'haar');

figure;
subplot(2, 2, 1);
imshow(originalImage, []);
title('Original Lena image');

subplot(2, 2, 2);
imshow(reconstructed_image, []);
title('Reconstructed Image');

reconstructed_uint8 = im2uint8(reconstructed_image);
imwrite(reconstructed_uint8, 'reconstructed_image.bmp');
