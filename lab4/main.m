% Given a generator matrix
% find Parity Check Matrix
% take a message
% encode it into codeword (linear systematic)
% introduce correctable error
% correct error via
% 1. Standard Array
% 2. (Hamming) ML Decoding
% 3. Syndrome Decoding

close all; clear all; clc;

G = [1 0 1 0 1; 0 1 0 1 1]
% systematic Generator example

[k,n] = size(G);

H = cat(2, transpose(G(:,n-k:n)), eye(n-k));
% parity-check matrix


AllMsgBits = truthtable(k);
% all possible k length message vectors


AllCodeBits = matmul(AllMsgBits, G);
% all possible n length codeword vectors


dmin = min(sum(AllCodeBits(2:end, :), 2));
% minimum Hamming distance


msgBits = AllMsgBits(randi(pow2(k)), :)
% take one at random


codeBits = matmul(msgBits, G)
% corresponding codeword 


% oneBitErrors = eye(n);
% one bit errors

%  radomOneBitError = oneBitErrors(randi(pow2(k)), :)
radomBitsError = [0 0 1 1 0]
% one at random

rxBits = bitxor(codeBits, radomBitsError)
% received msg with error

rxBits = codeBits;

% ml_decoded = HammingDecode(rxBits, G)
% ml_decoding

% synd_decoded = SyndromeDecode(rxBits, H)

std_decoded = StandardArrayDecoding(rxBits, G)



