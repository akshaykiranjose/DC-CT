function [decModSymbols, detBits] = myDemodulator(rxModSymbols, constellation)

% rxModSymbols [vector]: recieved symbols across the channel
% constellation[vector]: diagram corresponding to the modulation scheme
% detModSymbols[vector]: symbols decoded from the recieved symbols
% detBits[vector]: bitsteam corresponding to the symbol

M = length(constellation);
L = log2(M);
constell = reshape(constellation, [1, M]); % to be able to broadcast
distances = abs(constell - rxModSymbols);
[min_dist, idx] = min(distances, [], 2); % 2 is the dimension wrt which the min is sought

decModSymbols = constellation(idx);

symVec = zeros(length(decModSymbols), L);
for ii = 1:length(symVec)
    temp = find(constell == decModSymbols(ii))-1;
    symVec(ii,:) = dec2binVec(temp, L);
end

detBits = symVec(:);

end

