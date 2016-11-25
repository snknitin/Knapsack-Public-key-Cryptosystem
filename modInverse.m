function [output] =modInverse(a,m)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

a =mod(a,m);
for i=1:m 
if(mod((a*i),m)==1)
    output=i;
end
end

