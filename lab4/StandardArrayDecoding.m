function decoded = StandardArrayDecoding(received, G)

[k,n] = size(G);

AllMsgVecs = truthtable(k);
AllCodeWords = matmul(AllMsgVecs, G);


errors = cat(1, zeros(1,n), eye(n));

% StdArray = zeros(n+1, pow2(k), n);

StdArray = cell(pow2(n-k), pow2(k));

DecsToFind = 0:pow2(n)-1;
DecsFound = [];
count = 1;

for ii = 1:n+1

    for jj = 1:pow2(k)

          if(ii == 1)
               StdArray{ii, jj} = AllCodeWords(jj, :);
         
          elseif (jj == 1)
              StdArray{ii, jj} = errors(ii, :);

          else
              StdArray{ii, jj} = bitxor(StdArray{ii, 1}, StdArray{1, jj});
 
          end

          DecsFound(count) = binVecToDec(StdArray{ii, jj});
          count = count + 1;
    end
end

isElem = cellfun(@(x)isequal(x, received), StdArray);
[row, col] = find(isElem);

for i = 1:length(DecsFound)
 DecsToFind = DecsToFind(DecsToFind ~= DecsFound(i)); 
end

OtherBitPatterns = cell(1, length(DecsToFind));

for i = 1:length(DecsToFind)
    OtherBitPatterns{1,i} = dec2binVec(DecsToFind(i), n);
end

% errors(2,:)
% 
% errors

found = false;
indexes = [];

for i = 1:length(OtherBitPatterns)
    if sum(OtherBitPatterns{1,i}) == 2
        found = true;
        err_patterns = bitxor(AllCodeWords(2:end, :), OtherBitPatterns{1,i});
        for j = 1:size(err_patterns, 1)
            isElem = cellfun(@(x)isequal(x, err_patterns(j,:)), StdArray);
            if sum(isElem(:)) > 0
                found = false;
                break;
            end
        end
        if found
            indexes(end+1) = i;
        end
    end
end

count = 1;
for i = n+2: pow2(n-k)
    StdArray{i,1} = OtherBitPatterns{1, indexes(count)};
    count = count + 1;
end

for ii = n+2: pow2(n-k)

    for jj = 1:pow2(k)
              StdArray{ii, jj} = bitxor(StdArray{ii, 1}, StdArray{1, jj});
 
    end
end

decs = cellfun(@(x) binVecToDec(x), StdArray)
length(unique(decs(:)))
StdArray

decoded = StdArray{1, col};

end