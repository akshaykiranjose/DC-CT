function outBits = myDecoder(inBits, reps)
% inBits: vector of bits
% reps: repetition in code
% outBits: the mode(row wise) of the encoded bits reshaped, aka the most
% common element in the row
    l = length(inBits);
    reshaped = reshape(inBits, [reps, l/reps]);
    outBits = reshape(mode(reshaped, 1), [l/reps,1]);

end