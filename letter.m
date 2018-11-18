function mm=letter(I)
    
Io=I;
    
    
%% Pre processing
       if size(I,3)==3
           I=rgb2gray(I); 
       end
       I=imresize(I,[256,256]);
       I=double(I); 

  %%
 imag=I;
%     HE = double(I);
    HE = double(histeq(uint8(I))); 

   
   %%
   
   level = graythresh(I);
BW =HE>level;

%% 
se = strel('disk',2);
erodedI = imerode(BW,se);
erodedI = imdilate(erodedI,se);

%%
imagen=~erodedI;
word=[ ];

re=imagen;

%Opens text.txt as file for write
fid = fopen('text.txt', 'wt');


%                                          se3 = strel('disk',2);
%                                          re=imerode(re,se3);
%                                          se3 = strel('disk',2);
%                                          re=imdilate(re,se3);
                                         re=bwareaopen(re,20);
%                                          se3 = strel('disk',1);
%                                          re=imerode(re,se3);
        labeledImage = bwlabel(re, 4);  
        stats = regionprops(labeledImage,'BoundingBox','Area');
        area = cat(1,stats.Area);
%         area=area(find(area>20));
        if length(area)>1 
            word1=[]; 
            for g=1:length(area) 
                if area(g)>100
                [r,c] = find(labeledImage==g);
            fc=re(min(r):max(r),min(c):max(c));
            img_r = imresize(fc,[42 24]);   %resize letter so that correlation
                                       %can be performed
       
       imwrite(img_r,[num2str(g),'.jpg']);
       %Fcn 'read_letter' correlates the cropped letter with the images
       %given in the folder 'letters_numbers'
        [a,letter] = read_letter(img_r);
        
        
        
         if a>0.65
         else
             for sv=1:size(re,1)
                for vs=1:size(re,2)
                      if labeledImage(sv,vs)==g
                           re(sv,vs)=0;
                      end
                end
            end
         end
%        figure,imshow(img_r);
       %letter concatenation 
%       
%        if a>0.4
% %             n = n + 1;
% %             spacevector(n)=space;  
% %        word = [word letter];
                else
%             [r,c] = find(labeledImage==g);
            for sv=1:size(re,1)
                for vs=1:size(re,2)
                      if labeledImage(sv,vs)==g
                           re(sv,vs)=0;
                      end
                end
            end
%         end
            
%             letter=word1;
%                 end
                end
            end
%         else

 
        end

        
        %%
        re1=re;
%         figure,imshow(re);
% title('LETTER MATCHED IMAGE');
%          
%          se3 = strel('disk',3);
%        re=imdilate(re,se3);
       labeledImage = bwlabel(re, 4);
 num=[];
    % open the file and read it
 
 re =re1;
 while 1 
    %Fcn 'lines_crop' separate lines in text
   
    [fl re]=lines_crop(re); %fl= first line, re= remaining image
%     fl=imerode(fl,se2);

imgn=fl;
    n=0;
    %Uncomment line below to see lines one by one
    %figure,imshow(fl);pause(2)  
    %-----------------------------------------------------------------
    if length(fl)>20 & length(fl)<50
        fg=4;
    else
        fg=3;
    end
    rc = fl;              
    rc=hist_process(rc); 
    se3 = strel('disk',fg);
    fl1=rc;%,se3);
    [L3 Ne2]=bwlabel(fl1);
    for jk=1:Ne2
       [r,c] = find(L3==jk);
       fc=rc(min(r):max(r),min(c):max(c));
     
        
        %Fcn 'letter_crop' separate letters in a line
       
     labeledImage = bwlabel(fc, 4);  
        stats = regionprops(labeledImage,'BoundingBox','Area');
        area = cat(1,stats.Area);
%         area=area(find(area>20));
        
            for g=1:length(area) 
                
                [r1,c1] = find(labeledImage==g);
            fc1=fc(min(r1):max(r1),min(c1):max(c1));
            img_r = imresize(fc1,[42 24]);   %resize letter so that correlation
                                       %can be performed
       
       
       %Fcn 'read_letter' correlates the cropped letter with the images
       %given in the folder 'letters_numbers'
       [a,letter] = read_letter(img_r);
%        figure,imshow(img_r);
       %letter concatenation 
      
       if a>0.5
% [fl,re]=lines_crop(re,handles.img); %fl= first line, re= remaining image  
% fclose(fid);
 fprintf(fid,'%s',letter);
%Open 'text.txt' file
% winopen('text.txt');

      num=[num letter]; 
                
            
        end
    end
    fprintf(fid,'%s',' ');
    end
     fprintf(fid,'\n');
     if isempty(re)
         break;
     end
 end

    
winopen('text.txt');

%%
cv=zeros(256);
cv1=zeros(256);
[r,c] = find(re1==1);
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
%%

[labeledImage,nl] = bwlabel(cv, 4);  
        stats = regionprops(labeledImage,'BoundingBox','Area');
        area = cat(1,stats.Area);
        [a,b]=max(area);
[r,c] = find(labeledImage==b);
m=max(c)-min(c);
 msgbox(['THE RUBBER PLANT NUMBER= ',num,'    GRITH OF PLANT = ',num2str(m)]);

mm=m;


 end