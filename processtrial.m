clc
clear all
clf

a=imread('trial.jpg','jpg');
%b=size(a)
imshow(a,'InitialMagnification','fit')
c=dec2bin(a);
whos