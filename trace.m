[file,path]=uigetfile('.','Select input image');
	I=imread(strcat(path,file));

X = im2bw(I,0.8);

subplot(2,2,1);
imshow(X);

Dist=bwdist(X);

subplot(2,2,2);
imshow(Dist,[]);

RegionMax=imregionalmax(Dist);

[x, y] = find(RegionMax ~= 0);

subplot(2,2,3);
imshow(RegionMax);


List(1:size(x))=0;
for i = 1:size(x) 
List(i)=Dist(x(i),y(i));
end