function output = convencode(input)

    output = [];
    m1 = 0;
    m2 = 0;

    for i = 1:length(input)
      output(end+1) = mod2sum(input(i), m2);
      output(end+1) = mod2sum(input(i), m1, m2);
      m2 = m1;
      m1 = input(i);
    end

    while m1 ~= 0 || m2 ~= 0
        output(end+1) = mod2sum(0, m2);
        output(end+1) = mod2sum(0, m1, m2);
        m2 = m1;
        m1 = 0;
    end

end