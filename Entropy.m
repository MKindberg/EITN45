function H=Entropy(P)
% The Entropy function H(X)
%
% P column vector: the vector is the probability distribution.
% P matrix: Each column vector is interpreted as a probability distribution
% P scalar: The binary entropy function of [P; 1-P]
% P row vector: Each position gives binary entropy function

[m, n]=size(P);
if [m n] == [1 1]   %Scalar
    H=-P*lg2(P)-(1-P)*lg2(1-P);
elseif n==1         %Column vector
    H=sum(-P.*lg2(P));
elseif m==1         %Row vector
    H=-P.*lg2(P)-(1-P).*lg2(1-P);
else                %matrix
    H=sum(-P.*lg2(P));
end


function a=lg2(n)
a=arrayfun(@lg2_, n);

function a = lg2_(n)
if(n==0)
    n=0.0001;
end
a=log2(n);