%% Test arithmatic encoding
keys = {'a', 'b', 'c', 'd'};
vals = [0.1 0.5 0.1 0.3];
p = containers.Map(keys, vals);

seq = 'cbbadd';

codeWord = arithmCode(seq, p, false);

fprintf('[INFO] Code word for sequence %s: %s.\n', seq, codeWord);

% input code word into arithmatic decoding function
nSymbols = 6;
seqDec = arithmDecode(codeWord, p, nSymbols);
fprintf('[INFO] Sequence for code word %s: %s.\n', codeWord, seqDec);

match = true;
for i = 1 : length(seq)
    if seq(i) ~= seqDec(i)
        match = false;
        break;
    end
end
if match
    fprintf('[INFO] Code word is correct.\n');
else
    fprintf('[INFO] Code word is wrong.\n');
end

%% Test arithmatic decoding
keys = {'a', 'b', 'c', 'd'};
vals = [0.1 0.5 0.1 0.3];
p = containers.Map(keys, vals);

codeWord = '10100110111100111101010000101100';
nSymbols = 12;
seq = arithmDecode(codeWord, p, nSymbols);
fprintf('[INFO] Sequence for code word %s: %s.\n', codeWord, seq);

% input decoded sequence into arithmatic coding function
codeWordCompute = arithmCode(seq, p, false);

fprintf('[INFO] Code word for sequence %s: %s.\n', seq, codeWordCompute);

match = true;
for i = 1 : length(codeWordCompute)
    if codeWord(i) ~= codeWordCompute(i)
        match = false;
        break;
    end
end
if match
    fprintf('[INFO] Decoded sequence is correct.\n');
else
    fprintf('[INFO] Decoded sequence is wrong.\n');
end