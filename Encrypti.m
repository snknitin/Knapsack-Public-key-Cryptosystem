function [E] = Encrypti(k,w,im,c)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
tic

for i=1:k
E(i)=sum(im(i,:).*c);
end
toc

