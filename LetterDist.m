clear;
fid = fopen('LifeOnMars.txt');
txt = fscanf(fid,'%c');
fclose(fid);

letters=cast(txt, 'uint8');

count=zeros(1, 122);

% Count the ocurances of each letter
for i = letters
    count(i)=count(i)+1;
end

% Turn the count into probability.
dist=count/sum(count);

% Remove all zeros and change to a better format.
distM=[];
for i=1:122
    if dist(i)~=0
        distM=[distM;{cast(i, 'char')} {dist(i)}];
    end
end

% Calculate the codewords.
C=Huffman(distM);

% Encrypt the text
E=encrypt(txt, C);

% Calculate the average number of bits per symbol.
compRatio = (length(txt)*8)/length(E)

bps = length(E)/(length(txt))

entropy = Entropy(cell2mat(distM(:,2)))

ratio01 = length(strfind(E, '0'))/length(strfind(E, '1')) 
