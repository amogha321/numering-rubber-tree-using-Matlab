%function lines%
%
function [fl re]=lines_crop(im_texto)

im_texto=clip(im_texto);
num_filas=size(im_texto,1);
for s=1:num_filas
    if sum(im_texto(s,:))==0
        nm=im_texto(1:s-1, :); % First line matrix
        %pause(1);
        rm=im_texto(s:end, :);% Remain line matrix
        %pause(1);
        fl = clip(nm);
        pause(1);
        re=clip(rm);
        %*-*-*Uncomment lines below to see the result*-*-*-*-
               %subplot(2,1,1);imshow(fl);
               %subplot(2,1,2);imshow(re);
        break
    else
        fl=im_texto;%Only one line.
        re=[ ];
    end
     if (isempty(fl))
         break;
     else
         return
     end
end
return

%subplot(3,1,1);imshow(im_texto);title('INPUT IMAGE')
%subplot(3,1,2);imshow(fl);title('FIRST LINE')
%subplot(3,1,3);imshow(re);title('REMAIN LINES')

function img_out=clip(img_in)
[f c]=find(img_in);
img_out=img_in(min(f):max(f),min(c):max(c));

