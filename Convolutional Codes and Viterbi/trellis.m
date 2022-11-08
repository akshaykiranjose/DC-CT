function varargout = trellis(inp, state)

    out = [];
    out(end+1) = mod2sum(inp, state(2));
    out(end+1) = mod2sum(inp, state(1), state(2));

    varargout{2} = [inp state(1)];
    varargout{1} = out;

end