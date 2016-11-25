function [h] = Decrypti(E,q,x)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
l=numel(E);
for j=1:l
    h(j)= mod(E(j)*q,x);
end

end

