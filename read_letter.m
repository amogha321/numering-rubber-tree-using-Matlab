function [a,letter]=read_letter(imagn)
%Computes the correlation between template and input image
%and its output is a string containing the letter.
%Size of 'imagn' must be 42 x 24 pixels
%Example:
% imagn=imread('D.bmp');
% letter=read_letter(imagn)
% Load_Data_Name=['template_english.mat'];
% load(Load_Data_Name);
% comp=[]; 
%load template_english
% for n=1:62
%     sem=corr2(template_en{1,n},imagn);
%     comp=[comp sem];
% end

% vd=find(comp==max(comp));
[a,vd]=my_main(imagn);
%*-*-*-*-*-*-*-*-*-*-*-*-*- 
if vd>0
vd=vd(1);
if vd==1
    letter='1';
elseif vd==2
    letter='2';
elseif vd==3
    letter='3';
elseif vd==4
    letter='4';
elseif vd==5
    letter='5';
elseif vd==6
    letter='6';
elseif vd==7
    letter='7';
elseif vd==8
    letter='8';
elseif vd==9
    letter='9';
elseif vd==10
    letter='0';

else
    letter='#';
end 

end


