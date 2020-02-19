%% Test huffman coding

%% Generate random sequences and do huffman block coding
%%
% 
% * M = 1
seqLen = 1e5;
blockSize = 1;
% probability with 0.4
p = 0.4;
[seq, seqProb] = seqGen(seqLen, blockSize, p);

% huffman coding
[codeBook, indx] = huffmanCode(seqProb);
codeBook = codeBook(indx(end, :));

% calcualte code length
codeLen = zeros(length(codeBook), 1);
for i = 1:length(codeBook)
    codeLen(i) = length(char(codeBook(i,1)));
end
seqEntropy = -sum( seqProb .* log2( seqProb ) );
avHuffmanCodeLen = seqProb * codeLen;
fprintf('Given p = %.3f, sequence entropy is: %.3f, average code length is: %.3f.\n', ...
    p, seqEntropy, avHuffmanCodeLen);
for i = 1:length(codeBook)
    fprintf('code for block %s (p=%.3f) is: %s,\n', ...
        dec2bin(seq(i), blockSize), seqProb(i), char(codeBook(i)))
end
fprintf('\n')

% probability with 0.1
p = 0.1;
[seq, seqProb] = seqGen(seqLen, blockSize, p);

% huffman coding
[codeBook, indx] = huffmanCode(seqProb);
codeBook = codeBook(indx(end, :));

% calcualte code length
codeLen = zeros(length(codeBook), 1);
for i = 1:length(codeBook)
    codeLen(i) = length(char(codeBook(i,1)));
end
seqEntropy = -sum( seqProb .* log2( seqProb ) );
avHuffmanCodeLen = seqProb * codeLen;
fprintf('Given p = %.3f, sequence entropy is: %.3f, average code length is: %.3f.\n', ...
    p, seqEntropy, avHuffmanCodeLen);
for i = 1:length(codeBook)
    fprintf('code for block %s (p=%.3f) is: %s,\n', ...
        dec2bin(seq(i), blockSize), seqProb(i), char(codeBook(i)))
end
fprintf('\n')

%%
% 
% * M = 2
seqLen = 1e5;
blockSize = 2;
% probability with 0.4
p = 0.4;
[seq, seqProb] = seqGen(seqLen, blockSize, p);

% huffman coding
[codeBook, indx] = huffmanCode(seqProb);
codeBook = codeBook(indx(end, :));

% calcualte code length
codeLen = zeros(length(codeBook), 1);
for i = 1:length(codeBook)
    codeLen(i) = length(char(codeBook(i,1)));
end
seqEntropy = -sum( seqProb .* log2( seqProb ) );
avHuffmanCodeLen = seqProb * codeLen;
fprintf('Given p = %.3f, sequence entropy is: %.3f, average code length is: %.3f.\n', ...
    p, seqEntropy, avHuffmanCodeLen);
for i = 1:length(codeBook)
    fprintf('code for block %s (p=%.3f) is: %s,\n', ...
        dec2bin(seq(i), blockSize), seqProb(i), char(codeBook(i)))
end
fprintf('\n')

% probability with 0.1
p = 0.1;
[seq, seqProb] = seqGen(seqLen, blockSize, p);

% huffman coding
[codeBook, indx] = huffmanCode(seqProb);
codeBook = codeBook(indx(end, :));

% calcualte code length
codeLen = zeros(length(codeBook), 1);
for i = 1:length(codeBook)
    codeLen(i) = length(char(codeBook(i,1)));
end
seqEntropy = -sum( seqProb .* log2( seqProb ) );
avHuffmanCodeLen = seqProb * codeLen;
fprintf('Given p = %.3f, sequence entropy is: %.3f, average code length is: %.3f.\n', ...
    p, seqEntropy, avHuffmanCodeLen);
for i = 1:length(codeBook)
    fprintf('code for block %s (p=%.3f) is: %s,\n', ...
        dec2bin(seq(i), blockSize), seqProb(i), char(codeBook(i)))
end
fprintf('\n')

%%
% 
% * M = 3
seqLen = 1e5;
blockSize = 3;
% probability with 0.4
p = 0.4;
[seq, seqProb] = seqGen(seqLen, blockSize, p);

% huffman coding
[codeBook, indx] = huffmanCode(seqProb);
codeBook = codeBook(indx(end, :));

% calcualte code length
codeLen = zeros(length(codeBook), 1);
for i = 1:length(codeBook)
    codeLen(i) = length(char(codeBook(i,1)));
end
seqEntropy = -sum( seqProb .* log2( seqProb ) );
avHuffmanCodeLen = seqProb * codeLen;
fprintf('Given p = %.3f, sequence entropy is: %.3f, average code length is: %.3f.\n', ...
    p, seqEntropy, avHuffmanCodeLen);
for i = 1:length(codeBook)
    fprintf('code for block %s (p=%.3f) is: %s,\n', ...
        dec2bin(seq(i), blockSize), seqProb(i), char(codeBook(i)))
end
fprintf('\n')

% probability with 0.1
p = 0.1;
[seq, seqProb] = seqGen(seqLen, blockSize, p);

% huffman coding
[codeBook, indx] = huffmanCode(seqProb);
codeBook = codeBook(indx(end, :));

% calcualte code length
codeLen = zeros(length(codeBook), 1);
for i = 1:length(codeBook)
    codeLen(i) = length(char(codeBook(i,1)));
end
seqEntropy = -sum( seqProb .* log2( seqProb ) );
avHuffmanCodeLen = seqProb * codeLen;
fprintf('Given p = %.3f, sequence entropy is: %.3f, average code length is: %.3f.\n', ...
    p, seqEntropy, avHuffmanCodeLen);
for i = 1:length(codeBook)
    fprintf('code for block %s (p=%.3f) is: %s,\n', ...
        dec2bin(seq(i), blockSize), seqProb(i), char(codeBook(i)))
end
fprintf('\n')