function dec = binVecToDec(binVec)

    dec = 0;
    for i = 1:length(binVec)
        dec = dec + binVec(i) * pow2(i-1);
    end

end