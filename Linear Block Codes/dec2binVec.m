function binVec = dec2binVec(decNum, minDigits)

binVec = zeros(1, minDigits);
bin = dec2bin(decNum, minDigits);

for ii = 1:minDigits
    binVec(1, ii) = str2num(bin(ii));
end

end