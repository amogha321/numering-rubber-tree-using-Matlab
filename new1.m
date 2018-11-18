
[file,path]=uigetfile('.','Select input image');
	I=imread(strcat(path,file));
    Io=I;
    
    
%% Pre processing
       if size(I,3)==3
           I=rgb2gray(I); 
       end
       I=imresize(I,[256,256]);
       I=double(I); 
   subplot(2,3,1),imshow(I,[]);
   title('Original Image');
  %%
 imag=I;
%     HE = double(I);
    HE = double(histeq(uint8(I))); 
   subplot(2,3,2),imshow(HE,[]);
   title('Pre-Processed Image'); 
   
   %%
   
   level = graythresh(I);
BW =HE>level;
subplot(2,3,3),imshow(BW,[]);
title('THRESHOLDED IMAGE');

%% 
se = strel('disk',2);
erodedI = imerode(BW,se);
erodedI = imdilate(erodedI,se);
subplot(2,3,4),imshow(~erodedI,[]);
title('Binary IMAGE');

cv=zeros(256);
cv1=zeros(256);
[r,c] = find(~erodedI==1);
m=min(c);
n=max(c);
for i=1:256
for j=1:256
if j>m-25 & j<n+25
cv(i,j)=~BW(i,j);
cv1(i,j)=I(i,j);
end
end
end
figure,imshow(cv1,[]);
figure,imshow(cv,[]);
%%

[labeledImage,nl] = bwlabel(cv, 4);  
        stats = regionprops(labeledImage,'BoundingBox','Area');
        area = cat(1,stats.Area);
        [a,b]=max(area);
[r,c] = find(labeledImage==b);
m=max(c)-min(c);
 msgbox(['GRITH OF PLANT in sqaure meters =',num2str(m)]);




