function y = vecconv(arr1,arr2)

    if(length(arr1)>length(arr2))
        x = arr1;
        h = arr2;
        Lx = length(x);
        Lh = length(h);
    else
        h = arr1;
        x = arr2;
        Lx = length(x);
        Lh = length(h);
    end

    Ly = Lx + Lh - 1;
    y = zeros(1,Ly);
    
    for n = 1 : Ly
        if(n <= Lh)
            y(n) = dot(x(1:n),h(n:-1:1));
        elseif (n > Ly-Lh)
            y(n) = dot(x(end-(Ly-n):end), h(end:-1:end-(Ly-n)));
        else
            y(n) = dot(x(n-Lh+1:n), h(end:-1:1));
        end
    end
end