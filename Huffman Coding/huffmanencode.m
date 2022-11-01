function encoded = huffmanencode(input, codedict)
% once the cell array is ready, it is easy to make the encoded symbol
% stream by just find the corresponding mapping in the cell array

    encoded = [];
    for i = 1:length(input)
        loc = find([codedict{:}] == input(i));
        encoded = [encoded codedict{loc, 2}];
    end
end