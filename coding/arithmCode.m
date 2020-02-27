function CodeWord = arithmCode(Seq, P, Debug, Lower, Upper, JointP)
% Arithmatic coding.
%
% Args:
%    Seq: input source sequence (string or char array)
%    P: probability for each symbol (dict)
%    Debug: enable debugging message (bool)
%    Lower: lower bound of the interval (double)
%    Upper: upper bound of the interval (double)
%
% Return:
%    CodeWord: code word for source sequence (binary array)

    if nargin < 3
        Debug = false;
        Lower = 0.0;
        Upper = 1.0;
        JointP = 1.0;
    elseif nargin < 4
        Lower = 0.0;
        Upper = 1.0;
        JointP = 1.0;
    end
    
    % Get the CDF
    cdfP = cumsum(cell2mat(P.values));
    valRange = Upper - Lower;
    Fl = Lower + (valRange * ([0 cdfP(1 : end-1)]));
    Fh = Lower + (valRange * cdfP);
    FlwithSymbol = containers.Map(P.keys, Fl);
    FhwithSymbol = containers.Map(P.keys, Fh);
    
    % Find the interval for current symbol
    if isempty(Seq) == 0
        curLower = FlwithSymbol(Seq(1));
        curUpper = FhwithSymbol(Seq(1));
        curJointP = JointP * P(Seq(1));
        % Recursively call arithmatic coding
        CodeWord = arithmCode(Seq(2:end), P, Debug, curLower, curUpper, curJointP);
    else
        % end coding, represent interval with binar format
        codeLen = ceil(log2(1/JointP)) + 2;
        stepSize = 1 / 2^codeLen;
        codeInt = round((Lower+Upper)/2/stepSize);
        % Debug
        if Debug
            fprintf('[DEBUG] Final code value: %d.\n', codeInt);
        end
        CodeWord = dec2bin(codeInt);
    end
    
    % Debug
    if Debug
        fprintf('[DEBUG] interval in current iter: [%f, %f].\n', Lower, Upper);
    end
end