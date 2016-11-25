function [Ee] = Encrypte(k,we,im,ce)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
tic

for i=1:k
E(i)=sum(im(i,:).*ce);
end
toc

