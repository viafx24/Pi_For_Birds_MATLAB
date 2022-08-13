Time_Pause=0.1;
Begin_Number=31;

a=dir(['F:\Documents\MATLAB\Pi_Mangeoire\Images\ ' '/*.jpg'])
out=size(a,1)
filename=['F:\Documents\MATLAB\Pi_Mangeoire\Images\picture_' num2str(Begin_Number) '.jpg'];
A = imread(filename);
himg = imshow(A);

for iteration=Begin_Number:out-1
   try 
    filename=['F:\Documents\MATLAB\Pi_Mangeoire\Images\picture_' int2str(iteration) '.jpg'];
    
    A = imread(filename);
	set(himg, 'CData', A);  %instead of imshow
    drawnow;
%     imshow(A);
     pause(Time_Pause);
   catch
       disp('lake this photo')
       disp(iteration)
   end
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