disp('Choose an Image  \n');
a=imread('small.png','png');
a=rgb2gray(a);
a=double(a);
sz1=size(a,1);
sz2=size(a,2);
b=reshape(a,1,(sz1*sz2))
k=numel(b);

% Convert the decimal grey level values to 8 bit binary
b=dec2bin(a);
im=uint8(b)-48;
whos;

%Enter odd and even knapsacks

we=input('Enter the Desired Weights of your knapsack for even rows in an array \n');
if(numel(we)~=8)
    disp('The number of weights should be equal to the length of individual Binary Strings \n');
end
Issuperinc(we);

wo=input('Enter the Desired Weights of your knapsack for odd rows in an array \n');
if(numel(wo)~=8)
    disp('The number of weights should be equal to the length of individual Binary Strings \n');
end
Issuperinc(wo);
% Enter the values for the generator and the modulo
pe=input('Enter The Prime Multipler(Generator) for even row knapsack \n');
xe= input('Enter The Modulo  \n')
pgmodcheck(xe,pe,we);

po=input('Enter The Prime Multipler(Generator) for odd row knapsack \n');
xo= input('Enter The Modulo  \n')
pgmodcheck(xo,po,wo);
% Generate Public key for even row
for j=1:8
    ce(j)= mod(we(j)*pe,xe);
end
ce = uint8(ce);
disp('The Even row Public key is  \n');
%disp(ce);

% Generate  Public ke for odd row
for j=1:8
    co(j)= mod(wo(j)*po,xo);
end
co = uint8(co);
disp('The Odd row Public key is  \n');
%disp(co);
tic
Ee = Encrypti(k,we,im,ce);
Eo = Encrypti(k,wo,im,co);
% Start The Encryption
for p =1:k
    if(rem(p,2)==0)
    E(p)=Ee(p)
    else
    E(p)=Eo(p)
    end
end
disp('The Encrypted Sequence is ------   ');
%disp(E);
toc;
te=toc-tic;

tic
% Find the inverses
qe=modInverse(pe,xe);
qo=modInverse(po,xo);

%Decode the Private Key
for r=1:8
    pe(r)= mod(ce(r)*qe,xe);
end

for r=1:8
    po(r)= mod(co(r)*qo,xo);
end
De= Decrypti(Ee,qe,xe);
Do= Decrypti(Eo,qo,xo);
% Decryption Sequence
for z =1:k
    if(rem(z,2)==0)
    D(z)= De(z);
    else
    D(z)= Do(z);
    end
end
disp(D);
disp('The Decrypted Sequence is ------   ');


k=numel(D);   
he=Decodei(De,we,k);
ho=Decodei(Do,wo,k);
h=zeros(k,8);


% Decode the binary in terms of weights 
for y =1:k
    if(rem(y,2)==0)
    h(y,:)=he(y,:)
    else
    h(y,:)=ho(y,:)
    end
end

disp('The Weighted values from the knapsack are  \n');
disp(h);

disp('The Decoded Message Is \n');
h=h+48;
g=bin2dec(char(h));
disp(g);
toc;

disp('Time of Encryption was \n');
disp(te);
fim=reshape(g,sz1,sz2);
imwrite(fim,'output.png','png');
figure(1),imshow(a),title('Sent Image');
figure(2),imshow(fim),title('Decrypted Image');






