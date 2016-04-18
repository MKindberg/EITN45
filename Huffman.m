function C=Huffman(D)

while size(D)>1
    %sort on probability
    D=sortrows(D, 2);
    %get 2 least probable from D
    new=[{['(' cell2mat(D(1, 1)) ',' cell2mat(D(2, 1)) ')']} {cell2mat(D(1, 2)) + cell2mat(D(2, 2))}];
    %remove them and add as one element
    D(1, :)=[];
    D(1, :)=new;
end
d=cell2mat(D(1));
code='';
keys=[];
vals=[];
for i=(length(d)-1):-1:1
    if d(i)==')'
        code=[code '0'];
    elseif d(i)=='(' && ~isempty(code)
        code(end)=[];
    elseif d(i)==',' && ~isempty(code)
        code(end)= '1';
    elseif d(i)==','
        code='1';
    else
        keys=[keys;{d(i)}];
        vals=[vals;{code}];
    end
end
C=containers.Map(keys, vals);