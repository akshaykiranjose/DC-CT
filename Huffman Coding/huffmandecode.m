function decoded = huffmandecode(input, codedict)
% the huffman decoding is also quite easy as it only amounts to finding the
% mapping instantaneously and the appending the mapped symbol to the
% decoded array
    decoded = [];
    len_dict = length(codedict);
    for i = 1:len_dict
        codedict{i,1}(end+1) = ' ';
        codedict{i,2} = sprintf("%d", codedict{i,2});
    end

    i = 0;
    while i < length(input)

        start = i+1;
        findd = find([codedict{:}] == sprintf("%d", input(start:i)));
        while ~isscalar (findd)    
            i = i + 1;
            findd = find([codedict{:}] == sprintf("%d", input(start:i)));
        end

        decoded = [decoded codedict{findd-len_dict, 1}];

    end

    decoded = replace(decoded, ' ', '');
end