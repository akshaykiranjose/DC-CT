function decoded = HammingDecode(received, G)

%     received: a vector of recieved bits, can also be a matrix 
%     size = (n, num_vectors)
%     Generator: Generator matrix size = (n, k)

    [k,n] = size(G);

    allMsgsVec = truthtable(k);

    allCodeVecs = matmul(allMsgsVec, G);

    hammingDistances = HammingDistance(received, allCodeVecs);

    [Hdistmin, loc] = min(hammingDistances);

    decoded = allCodeVecs(loc, :);
%     ML hamming decoding

end