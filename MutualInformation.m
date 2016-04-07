function I=MutualInformation(P)
% The mutual information I(X;Y)
%
% P=P(X,Y) is the joint probability of X and Y.
[m, n]=size(P);
I=0;
for i=1:m
    for j=1:n
        I=I + P(i, j) * lg2(P(i, j)/(sum(P(i, :))*sum(P(:, j))));
    end
end

function a=lg2(n)
a=arrayfun(@lg2_, n);

function a = lg2_(n)
if(n==0)
    n=0.0001;
end
a=log2(n);