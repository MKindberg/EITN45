%% a)
G01=ones(1, 2^1);
G02=ones(1, 2^2);
G11=eye(2^1);
G12=[G11 G11;zeros(size(G01)) G01];
G13=[G12 G12;zeros(size(G02)) G02];

%% b) 

C=[];
for i=0:15
    C=[C;mod(dec2bin(i, 4)*G13, 2)]; %all codewords
end

d=[];
for i=2:16
    d=[d;sum(C(i, :))]; %all hamming distances
end
dmin=min(d); %min hamming distance
errors=floor((dmin-1)/2); %guaranteed correctable errors

%% c)
mod(G13*G13', 2);