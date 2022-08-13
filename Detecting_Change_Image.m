clear all;
 figure;
 
 Time=100;
 tic
 for i=1500:2500
    Name=['C:\Users\Guillaume\Documents\MATLAB\Motor_Sleep_2020\Image_2020_03_01\image_' num2str(i) '.jpeg'];
    img1=rgb2gray(imread(Name));
 %   imshow(img1)

    Name=['C:\Users\Guillaume\Documents\MATLAB\Motor_Sleep_2020\Image_2020_03_01\image_' num2str(i+2) '.jpeg'];
    img2=rgb2gray(imread(Name));
 %   imshow(img2)

    NewImage=img2-img1;
  %  imshow(NewImage)
    Sum(i)=sum(sum(NewImage));
%    image(NewImage);

%   %  drawnow
 end
 toc
 
 plot(1:length(Sum),Sum)
