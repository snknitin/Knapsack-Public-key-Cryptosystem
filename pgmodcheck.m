
function y=pgmodcheck(x,p,W)
% To ensure that the chosen prime generator and the modulo are suitable
n=length(W);
k=0;
for i=1:n
    k= k+W(i);
end

if(x<k)
    disp('Chooose a modulo greater than the Sum of weights  \n');
    return
else
    disp('Modulo Value Acceptable \n');
end

if ~isprime(p)
    disp('The field order is not a prime number  \n');
    return
end

    if(mod(x,p)==0)
        disp('The modulo is a factor of the prime Generator. Not acceptable  \n');
    else
        disp('Prime Generator Acceptable  \n');
    end
    
%elseif sum(x>=p)
    %disp('All or some of the numbers do not belong to the field');
    return
if sum(~x)
    disp('0 does not have a multiplicative inverse  \n');
    return
end

