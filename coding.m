clc
clear all
close all
I=imread('C:\Users\HAIER\Documents\MATLAB\testImages_artphoto\amusement_0487.jpg');
% imshow(I)
I2=rgb2hsv(I);
h=I2(:,:,1);
s=I2(:,:,2);
v=I2(:,:,3);
sum=0;
new=s;
[height,width]=size(s);
Num_pixels=height*width;
for i=1:height
    for j=1:width
        sum=sum+new(i,j);
    end 
end 
%mean_Saturation of an image 
 mean_saturation=sum/Num_pixels;
% mean Saturation Contrast of an image
s1=abs(s);
new1=s1;
sum1=0;
for k=1:height
    for l=1:width
        sum1=sum1+new1(k,l);
    end 
end 
mean_saturation_Contrast=sum1/Num_pixels;
% % %mean_Brightness of an image
[height1 width1]=size(v);
 Num_pixels1=height1*width1;
 n1=v;
 sum2=0
 for m=1:height1
    for n=1:width1
        sum2=sum2+n1(m,n);
    end 
end 
mean_Brightness=sum2/Num_pixels1;
% %mean Brightness  Contrast of an image
v1=abs(v);
n2=v1;
sum3=0;
for x=1:height1
    for y=1:width1
        sum3=sum3+n2(x,y);
    end 
end 
mean_Brightness_Contrast=sum3/Num_pixels1;
% % Ratio of Dull Color
ind=find(v>0.7)
sz=size(ind,1)
Dull=v(ind)
DR=sz/Num_pixels1;
% Ratio of cool Colors
h1=h*360;
new1=h1;
cool1 =[];
for a1=1:height
    for b1=1:width
        if(new1(a1,b1)>=30 && new1(a1,b1)<=110)
            cool= new1(a1,b1);
            cool1= [cool1, cool];
        end  
    end 
end 
sz1=size(cool1,2);
CR=sz1/Num_pixels;
filename = 'C:\Users\HAIER\Documents\MATLAB\F1';
Features=[mean_saturation,mean_saturation_Contrast,mean_Brightness,mean_Brightness_Contrast,DR,CR]

xlswrite(filename,Features)













