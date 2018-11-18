function B=hist_process(B)
for i=1:size(B,2)
     f(i)=length(find(B(:,i)==1));
 end

% [output_peak,output_minima_low, output_minima_high,h] = findlocalminima(B,f);
a=f;
i1=1;
b=0;
for i=1:length(a)
    if a(i)>=0 && a(i)<=1
      b(i1)=i;
      i1=i1+1; 
    end
end
if b>1
for j=1:length(b)
%     c(j)=output_minima_low(b(j));
%     loc(j)=find(BW(:,c(j))==1);
    B(:,b)=0;
%     BW(:,c(j)-7:c(j)-5)=0;
   
end
else
    B;
end
end