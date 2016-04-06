function I=MutualInformation(P)
% The mutual information I(X;Y)
%
% P=P(X,Y) is the joint probability of X and Y.
[m, n]=size(P);
I=0;
for i=0:m
    for j=0:n
        I=I+P(m, n)*log2(P(m, n)/(sum(P(m, :))*sum(P(:, n))));
    end
end