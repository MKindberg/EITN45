clear;
fid = fopen('LifeOnMars.txt');
Txt = fscanf(fid,'%c');
fclose(fid);

Letters=cast(Txt, 'uint8');

count=zeros(1, 122);

for i = Letters
    count(i)=count(i)+1;
end
    
dist=count/length(Letters);
distKeys=[];
distVals=[];
for i=1:122
    if dist(i)~=0
        distKeys=[distKeys;mat2cell(cast(i, 'char'), 1)];
        distVals=[distVals dist(i)];
    end
end
distMap=containers.Map(distKeys, distVals)