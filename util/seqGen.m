%% Sequence generation function
function [Seq, SeqProb] = seqGen(NumSamples, SeqLen, P)
    level = zeros( SeqLen, 1 );
    % create a 'level' to convert binary to integer
    for i = 0:SeqLen-1
        level( i+1, 1 ) = 2^i;
    end
    p = P;
    seqUni = rand(NumSamples, SeqLen);
    % use uniform combined with a threshold 'p' to generate binary sequency
    % with probability 'p'
    seqBin = seqUni < p;
    % each unique sequence has a unique integer value
    seq2Int = seqBin * level;
    seqUniq = unique( seq2Int, 'rows' );
    seqCount = hist( seq2Int, seqUniq );
    seqProb = seqCount ./ sum( seqCount );
    Seq = seqUniq;
    SeqProb = seqProb;
end