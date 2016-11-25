function [] = Issuperinc(W)
%UNTITLED2 Summary of this function goes here
%   To find out if a sequence of weights chosen is super increasing or not
n=length(W);
sum=0;
for i=1:n
  if(W(i)<sum)
      fprintf('Not a Super Increasing Sequence  \n');
    return;
  end 
    if(W(i)>sum) 
         sum= sum+W(i);
    end
end 
  fprintf('This is a Super increasing Sequence   \n');
  

