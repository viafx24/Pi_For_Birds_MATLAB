
a=dir(['F:\Documents\MATLAB\Pi_Mangeoire\Images\ ' '/*.jpg'])
out=size(a,1)

Time_Pause=0.1;
filename=['F:\Documents\MATLAB\Pi_Mangeoire\Images\picture_1.jpg'];
A = imread(filename);
himg = imshow(A);
for iteration=2:out-1
    
    filename=['F:\Documents\MATLAB\Pi_Mangeoire\Images\picture_' int2str(iteration) '.jpg'];
    
    A = imread(filename);
	set(himg, 'CData', A);  %instead of imshow
    drawnow;
%     imshow(A);
     pause(0.3);
%     iteration    
end


% himg = imshow( first_frame);
% while 1,
%     frame =  getsnapshot(vid);
%     %all your other code here
%     set(himg, 'CData', A);  %instead of imshow
%     drawnow;
%     prevFaceList = newFaceList;
% end