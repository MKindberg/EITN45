function E=encrypt(T, C)
E=[];
for i=1:length(T)
    %if(cast(T(i), 'uint8')~=13)
        E=[E C(T(i))];
    %end
end