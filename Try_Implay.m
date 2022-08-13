a=dir(['F:\Documents\MATLAB\Pi_Mangeoire\Images\ ' '/*.jpg'])
out=size(a,1)

tic
v = VideoWriter('F:\Documents\MATLAB\Pi_Mangeoire\Video\newfile_2.mp4','MPEG-4');
v.Quality = 50;% 56 mega for 250 photo. with default, 25mega. default
%looks ok.

open(v)


for iteration=1:out
    Lead_Zero_Iteration=str(iteration).zfill(5)
    filename=['F:\Documents\MATLAB\Pi_Mangeoire\Images\picture_' int2str(iteration) '.jpg'];
    A = imread(filename);
    writeVideo(v,A)
end
close(v)  

toc

handle = implay('F:\Documents\MATLAB\Pi_Mangeoire\Video\video.mp4');
handle.Parent.WindowState= 'maximized' ;