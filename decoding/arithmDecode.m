function Seq = arithmDecode(CodeWord, P, NSymbols, Debug, Lower, Upper)
% Arithmactic decoding.
%
% Args:
%     CodeWord: arithmatic coding word (binary array)
%     P: probability for each symbol (dict)
%     NSymbols: number of source symbols (int)
%     Debug: enable debugging message (bool)
%     Lower: lower bound of the interval (double)
%     Upper: upper bound of the interval (double)
%
% Return:
%     Seq: source sequences (string or char array)

    if nargin < 4
        Debug = false;
        Lower = 0.0;
        Upper = 1.0;
    elseif nargin < 5
        Lower = 0.0;
        Upper = 1.0;
    end
    
    % Get the step size
    codeLen = length(CodeWord);
    stepSize = 1 / (2^codeLen);
    codeInt = bin2dec(CodeWord);
    codeVal = codeInt * stepSize;
    
    % Get the CDF
    cdfP = cumsum(cell2mat(P.values));
    valRange = Upper - Lower;
    Fl = Lower + (valRange * ([0 cdfP(1 : end-1)]));
    Fh = Lower + (valRange * cdfP);
    FlwithSymbol = containers.Map(P.keys, Fl);
    FhwithSymbol = containers.Map(P.keys, Fh);
    
    keys = P.keys;
    if NSymbols > 0
        for i = 1 : length(P)
            curkey = char(keys(i));
            if FlwithSymbol(curkey) <= codeVal && ...
               FhwithSymbol(curkey) > codeVal
                curSymbol = curkey;
                curLower = FlwithSymbol(curkey);
                curUpper = FhwithSymbol(curkey);
                break;
            end
        end
        subSeq = arithmDecode (CodeWord, P, NSymbols-1, Debug, curLower, curUpper);
        Seq = [curSymbol, subSeq];
    else
        Seq = '';
    end
end