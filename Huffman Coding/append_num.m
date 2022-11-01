
function output = append_num(input, addnum)

    output = input;
    locs = find(input == -1);
    
    for i = 2:length(locs)
        output = [output(1:locs(i) + i - 3) addnum output(locs(i) + i - 2:end)];
    end

    output(end+1) = addnum;
    
end