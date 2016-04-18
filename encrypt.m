function E=encrypt(T, D)
% Encrypts the given text according to the given dictionary.
%
% T: The text to be encrypted.
% D: The dictionary to encrypt by.


E=[];
for i=1:length(T)
    E=[E D(T(i))];
end