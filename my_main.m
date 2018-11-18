function[a, b]=letter(temp)
for i=1:10
    
d=dir(['let\',num2str(i),'\*.jpg']);

for j=1:length(d)
    
    img=imread(['let\',num2str(i),'\',d(j).name]);
    img=im2bw(img);
    cor(j)=corr2(img,temp);
end
fcor(i)=max(cor);
end
[a,b]=max(fcor);
a
end
