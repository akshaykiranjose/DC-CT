function y = convolve(x,h)

    Lx = length(x);
    Lh = length(h);
    Ly = Lx + Lh - 1;
    y = zeros(1,Ly);
    
    for n = 1:Lx
        for k = 1:Lh 
            y(n+k-1) = y(n+k-1) + h(k)*x(n); 
        end
    end
end