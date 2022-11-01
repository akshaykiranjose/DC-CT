function Hdist = HammingDistance(received, CodewordMatrix)

% received: n length bit vector
% CodewordMatrix: All codewords

% find individual Hamming Distance between received and all codewords

Hdist = sum(bitxor(received, CodewordMatrix), 2);

%returns Hamming distance vector

end