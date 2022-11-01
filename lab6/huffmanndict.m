function [freqt, huffdict] = huffmanndict(input)
       % input: a string or a matlab array to be encoded
       freqt = probabDistr(input);

       distr = freqt;
        
       [n,~] = size(distr);

     
    for i = 1:n
        distr{i,3} = 0;
        distr{i,4} = -1;
    end

    curr_iter = 1;

    while size(distr, 1) ~= 1

        distr = sortrows(distr, [2, 3]);

        distr{1,4} = append_num(distr{1,4}, 0);
        distr{2,4} = append_num(distr{2,4}, 1);
        
        top_2 = cellfun(@(x, y){x,y}, distr(1,:), distr(2,:), 'UniformOutput',false);

        distr = distr(2:end, :);

        distr(1, :) = top_2;

        distr{1,3} = curr_iter;

        distr{1,2} = sum([distr{1,2}{:}]);

        curr_iter = curr_iter + 1;

        for i = 1:size(distr, 1)
            if iscell(distr{i,1})
                distr{i,1} = [distr{i,1}{:}];
            end

            if iscell(distr{i,4})
                distr{i,4} = [distr{i,4}{:}];
            end

        end

    end
%     end of while loop

%     return
    symbols = distr{1,1};
    huffcode = distr{1,4};

    huffdict = {length(symbols), 2};

    for i = 1:length(symbols)
        huffdict{i,1} = symbols(i);
        huffdict{i,2} = [-1];
    end

    locs = find(huffcode == -1);

    for i = 1:length(locs)
        if i < length(locs)
            huffdict{i,2} = flip(huffcode(locs(i) + 1:locs(i+1)-1));
        else
            huffdict{i,2} = flip(huffcode(locs(i) + 1:end));
        end
    end
end


function distr = probabDistr(input)
% input: a string or a matlab array to be encoded
% distr: a cell array that gives the distribution of the characters of the
%        input in order of frequency

    uniq = [];
    probs = [];
    for i = 1:length(input)      
        if ~isscalar(find(uniq ==  input(i)))    
            uniq(end+1) = input(i);
            probs(end+1) = count(input, input(i));
        end
    end 
    probs = probs; %./length(input);
    distr = cat(1, uniq, probs)';
    distr = num2cell(distr);
    distr (:,1) = cellfun(@(x) char(x), distr(:,1), 'UniformOutput',false);
end

function output = append_num(input, addnum)

    output = input;
    locs = find(input == -1);
    
    if length(locs) == 1
        output = [input addnum];
    else
        for i = 2:length(locs)
            output = [output(1:locs(i) + i - 3) addnum output(locs(i) + i - 2:end)];
        end
        output(end+1) = addnum;
    end

end
