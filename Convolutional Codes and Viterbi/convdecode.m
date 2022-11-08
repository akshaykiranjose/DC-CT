function varargout = convdecode(input)

    len = length(input)/2;

    table = cell(4, len+1);

    for i = 1:size(table,1)
        for j = 1:size(table, 2)
            table{i,j} = 0;
        end
    end

    for j = 2:3      
        if j == 2
             k = -1;
        else
             k = 0;
        end
        for i = 1:size(table, 1)           
            if (j == 2 || j == 3) && i == 1
                table{i,j} = table{1,j-1} + hamm(input(j+k:j+k+1), trellis(0, [0 0]));
            elseif (j == 2 || j == 3) && i == 2               
                table{i,j} = table{1,j-1} + hamm(input(j+k:j+k+1), trellis(1, [0 0]));
            elseif j == 3 && i == 3
                table{i,j} = table{2,j-1} + hamm(input(j+k:j+k+1), trellis(0, [1 0]));
            elseif j == 3 && i == 4
                table{i,j} = table{2,j-1} + hamm(input(j+k:j+k+1), trellis(1, [1 0]));
            end
        end
    end

    k = 1;
    for j = 4:size(table, 2)  
        for i = 1:size(table, 1)
            if i == 1
                table{i,j} = min (table{1,j-1} + hamm(input(j+k:j+k+1), trellis(0, [0 0])), ...
                    table{3,j-1} + hamm(input(j+k:j+k+1), trellis(0, [0 1])) );
            elseif i == 2
                table{i,j} = min (table{1,j-1} + hamm(input(j+k:j+k+1), trellis(1, [0 0])), ...
                    table{3,j-1} + hamm(input(j+k:j+k+1), trellis(1, [0 1])) );
            elseif i == 3
                table{i,j} = min (table{2,j-1} + hamm(input(j+k:j+k+1), trellis(0, [1 0])), ...
                    table{4,j-1} + hamm(input(j+k:j+k+1), trellis(0, [1 1])) );
            else
                table{i,j}= min( table{2,j-1} + hamm(input(j+k:j+k+1), trellis(1, [1 0])), ...
                    table{4,j-1} + hamm(input(j+k:j+k+1), trellis(1, [1 1])) );
            end
        end
        k = k + 1;
    end
    
    decoded = [];
%     [~, start_idx] = min([table{:,end}]);

    prev_state = 1;

    for j = size(table, 2)-1: -1 : 3
        
        if mod(prev_state, 2) == 0
            decoded(end+1) = 1;
        else
            decoded(end+1) = 0;
        end

        prev_state = find_state(prev_state, j, table)  ;
           
    end

    for j = 2:-1:1

        if prev_state == 1 
            prev_state = 1;
            decoded(end+1) = 0;

        elseif prev_state == 2
            prev_state = 1;
            decoded(end+1) = 1;

        elseif prev_state == 3
            prev_state = 2;
            decoded(end+1) = 0;

        else
            prev_state = 2;
            decoded(end+1) = 1;
        end

    end

    varargout{1} = table;
    varargout{2} = flip(decoded);

end

function dist = hamm(inp1, inp2)
    dist = sum(inp1 ~= inp2);
end

function prev_state = find_state(curr_idx, col_idx, table)

    if curr_idx == 1 || curr_idx == 2
           if table{1, col_idx} < table{3, col_idx}
               prev_state = 1;
           else
               prev_state = 3;
           end
    else
           if table{2, col_idx} < table{4, col_idx}
               prev_state = 2;
           else
               prev_state = 4;
           end
    end 
end
