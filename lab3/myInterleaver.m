function [interleavedBits] = myInterleaver(inBits, rowKey)
% inBits: vector of bits
% interleavedBits: the bits interleaved(row write and column read)
% m: the row size of the interleaving matrix
    l = length(inBits);
    m = rowKey;
    order = reshape(inBits, [m, l/m]);
    interleavedBits = reshape(transpose(order), [l, 1]);

end