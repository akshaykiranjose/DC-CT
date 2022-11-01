function y = correlate(x,h)
    y = convolve(x, h(end:-1:1));
end