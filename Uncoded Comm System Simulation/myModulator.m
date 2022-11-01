function modSymbols = myModulator(txBits, constellation)

% txBits [vector](n x 1): bits to be modulated into symbols and sent across
% constellation[vector](M x 1): diagram corresponding to the modulation scheme
% modSymbols[vector]: symbols made from modulation

bitsPerSymbol = log2(length(constellation));
numBits = length(txBits);
txBits = reshape(txBits, [numBits/bitsPerSymbol, bitsPerSymbol]);

integerOfBits = bin2dec(num2str(txBits));
modSymbols = constellation(integerOfBits+1);

end