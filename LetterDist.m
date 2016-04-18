clear;
fid = fopen('LifeOnMars.txt');
Txt = fscanf(fid,'%c');
fclose(fid);

Letters=cast(Txt, 'uint8');

count=zeros(1, 122);

for i = Letters
    count(i)=count(i)+1;
end
%count(13)=0;
    
dist=count/sum(count);

distM=[];
for i=1:122
    if dist(i)~=0
        distM=[distM;{cast(i, 'char')} {dist(i)}];
    end
end

C=Huffman(distM);

E=encrypt(Txt, C);

bps = length(E)/(length(Txt)*8)

ratio01 = length(strfind(E, '0'))/length(strfind(E, '1')) 

%matlabs inbyggda
sym=distM(:, 1);
p=cell2mat(distM(:, 2));
dict=huffmandict(sym, p);
comp=huffmanenco(Txt,dict);