function outBits = myDeinterleaver(inBits, rowKey)
% outBits: vector of de interleaved bits
% inBits: the bits interleaved(row write and column read)
% rowKey: the row size of the interleaving matrix

    l = length(inBits);
    m = rowKey;
    order = reshape(inBits, [l/m, m]);
    outBits = reshape(transpose(order), [l, 1]);
    
end