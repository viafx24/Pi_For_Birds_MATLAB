

outputFolder1=('F:\Documents\MATLAB\Pi_Mangeoire\Images');
v1=VideoReader('F:\Documents\MATLAB\Pi_Mangeoire\Video\video_0004.mp4');
vid1Frames=read(v1);
for frame=1:size(vid1Frames,4)
outputBaseFileName=sprintf('%3.3d.jpg',frame);
outputFullFileName=fullfile(outputFolder1,outputBaseFileName);
imwrite(vid1Frames(:,:,:,frame),outputFullFileName,'jpg');
end