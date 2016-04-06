function H=Entropy(P)
% The Entropy function H(X)
%
% P column vector: the vector is the probability distribution.
% P matrix: Each column vector is interpreted as a probability distribution
% P scalar: The binary entropy function of [P; 1-P]
% P row vector: Each position gives binary entropy function

[m, n]=size(P);
if([m, n]==[1 1])   %Scalar
    if(P==0)
        H=0;
    else
        H=-P*log2(P)-(1-P)*log2(1-P);
    end
elseif(n==1)        %Column vector
    H=sum(-P.*log2(P));
elseif(m==1)        %Row vector
    H=-P.*log2(P)-(1-P).*log2(1-P);
else                %matrix
    H=sum(-P.*log2(P));
end
end