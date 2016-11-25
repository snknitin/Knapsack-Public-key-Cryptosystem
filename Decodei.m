function [h] = Decodei(D,w,k)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

for i=1:k
    for j=8:-1:1
        b=D(i)-w(j);
        if(b<0)
                       h(i,j)=0;
        else
            h(i,j)=1;
        D(i)=b;    
        end
        
    end
        
end
end
