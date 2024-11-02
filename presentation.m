
originalImage = imread('lena.bmp');

temp = originalImage;
% level = 2;
wavelet = 'haar';

[LL1,LH1,HL1,HH1] = dwt2(temp,wavelet);
[LL2,LH2,HL2,HH2] = dwt2(LL1,wavelet);
[LL3,LH3,HL3,HH3] = dwt2(LL2,wavelet);

figure;
subplot(2, 2, 1);
imshow(LL3, []);
title('LL2');

subplot(2, 2, 2);
imshow(LH3, []);
title('LH2');

subplot(2, 2, 3);
imshow(HL3, []);
title('HL2');

subplot(2, 2, 4);
imshow(HH3, []);
title('HH2');

minDim = 8; 
% add threshold and quantization

quadtree_LL1 = qtdecomp(LL1, minDim);
quadtree_LH1 = qtdecomp(LH1, minDim);
quadtree_HL1 = qtdecomp(HL1, minDim);
quadtree_HH1 = qtdecomp(HH1, minDim);

symbols_LL = unique(quadtree_LL1(:));
probabilities_LL = histcounts(quadtree_LL1(:), [symbols_LL; inf]) / numel(quadtree_LL1);
dict_LL = custom_huffmandict(symbols_LL, probabilities_LL);
encoded_quadtree_LL = custom_huffmanenco(quadtree_LL1(:), dict_LL);

symbols_LH = unique(quadtree_LH1(:));
probabilities_LH = histcounts(quadtree_LH1(:), [symbols_LH; inf]) / numel(quadtree_LH1);
dict_LH = custom_huffmandict(symbols_LH, probabilities_LH);
encoded_quadtree_LH = custom_huffmanenco(quadtree_LH1(:), dict_LH);

symbols_HL = unique(quadtree_HL1(:));
probabilities_HL = histcounts(quadtree_HL1(:), [symbols_HL; inf]) / numel(quadtree_HL1);
dict_HL = custom_huffmandict(symbols_HL, probabilities_HL);
encoded_quadtree_HL = custom_huffmanenco(quadtree_HL1(:), dict_HL);

symbols_HH = unique(quadtree_HH1(:));
probabilities_HH = histcounts(quadtree_HH1(:), [symbols_HH; inf]) / numel(quadtree_HH1);
dict_HH = custom_huffmandict(symbols_HH, probabilities_HH);
encoded_quadtree_HH = custom_huffmanenco(quadtree_HH1(:), dict_HH);


symbols_Lena = unique(temp(:));
probabilities_Lena = histcounts(temp(:), [symbols_Lena; inf]) / numel(temp);
dict_Lena = custom_huffmandict(symbols_Lena, probabilities_Lena);
encoded_Lena = custom_huffmanenco(temp(:), dict_Lena);

fid = fopen('encoded_quadtree_LL.bin', 'wb');
fwrite(fid, encoded_quadtree_LL, 'ubit1');
fclose(fid);

fid = fopen('encoded_quadtree_LH.bin', 'wb');
fwrite(fid, encoded_quadtree_LH, 'ubit1');
fclose(fid);

fid = fopen('encoded_quadtree_HL.bin', 'wb');
fwrite(fid, encoded_quadtree_HL, 'ubit1');
fclose(fid);

fid = fopen('encoded_quadtree_HH.bin', 'wb');
fwrite(fid, encoded_quadtree_HH, 'ubit1');
fclose(fid);

fid = fopen('encoded_Lena.bin', 'wb');
fwrite(fid, encoded_Lena, 'ubit1');
fclose(fid);