close all;
clear all;
%figure;
tic
v = VideoReader('D:\MATLAB_DATA\Data_Pi_Mangeoire\Video_LD\LD_12-juil-2022_07-02-10.mp4');
Sum_Images=zeros([1 v.NumFrames ]);
Sum_Images_Only = zeros([1 v.NumFrames ]);

Skip_Frame=10

iteration=1;
Frame_1=rgb2gray(read(v,iteration));
iteration=2;

while iteration<v.NumFrames

    Frame_2=rgb2gray(read(v,iteration));
    Substract_Two_Images=Frame_2 -  Frame_1;
    Sum_Images(iteration)= sum(sum(Substract_Two_Images));
    Sum_Images_Only(iteration)=sum(sum(Frame_2));
    Frame_2 = Frame_1;
    iteration=iteration+Skip_Frame;
    iteration

    %Substract_Two_Images=rgb2gray(read(v,iteration+1)) -  rgb2gray(read(v,iteration));
    %toc
    %    imshow(Substract_Two_Images)
    
%     toc
%     Sum_Images(iteration);

    
end

plot(1:length(Sum_Images),Sum_Images,'-+')
figure
plot(1:length(Sum_Images),Sum_Images_Only,'-+')

toc