function summ = mod2sum(m, m1, m2)

    if nargin == 2
        summ = mod(m + m1, 2);
    elseif nargin == 3
        summ = mod(m + m1 + m2, 2);
    end

end