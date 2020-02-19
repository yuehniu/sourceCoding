function [CodeBook, Indx] = huffmanCode(P)
    % Huffman bottom-up: construct probability tree
    [pMerge, indxMerge] = huffmanBottomUp(P);
    CodeBook = huffmanTopDown(pMerge, indxMerge);
    [i1, i2] = sort(indxMerge(end, :));
    Indx = i2;
end

function [PMerge, IndxMerge] = huffmanBottomUp(P)
    % Huffman bottom-up: construct tree
    [pOrdered, indx] = sort(P); % Ascend sort
    
    % merge two smallest probability
    if length(pOrdered) > 2
        pOrdered(2) = pOrdered(2) + pOrdered(1);
        % recursive bottom-up
        pSub = pOrdered(2:length(pOrdered));
        [pMerge, indxMerge] = huffmanBottomUp(pSub);
    end
    
    % save merged probability in each level
    if length(pOrdered) == 2
        PMerge = pOrdered;
        IndxMerge = indx;
    else
        % fprintf('length of pMerge: %d, length of pOrdered: %d.\n', length(pMerge), length(pOrdered))
        nrow = size(pMerge, 1);
        PMerge = [pMerge zeros(nrow, 1); pOrdered];
        IndxMerge = [indxMerge zeros(nrow, 1); indx];
    end
end

function [CodeBook] = huffmanTopDown(PMerge, IndxMerge)
    [nrow, ncol] = size(PMerge);
    
    % recursive code each level
    if nnz(PMerge(end, :)) > 2
        codeBook = huffmanTopDown(PMerge(1:nrow-1, :), IndxMerge(1:nrow-1, :));
    end
    
    % find codewords
    % curIndx = IndxMerge(2, :);
    if nnz(PMerge(end, :)) == 2
        CodeBook = {'0'; '1'};
        % CodeBook = CodeBook(IndxMerge(end, 1:2));
    else
        prevIndx = find(IndxMerge(end-1, :)==1);
        if IndxMerge(end, 1) < IndxMerge(end, 2)
            code1append = '0';
            code2append = '1';
        else
            code1append = '1';
            code2append = '0';
        end
        CodeBook = [...
            strcat(codeBook(prevIndx), code1append); ...
            strcat(codeBook(prevIndx), code2append);...
            codeBook(1:prevIndx-1); ...
            codeBook(prevIndx+1:end)];
    end
    
end