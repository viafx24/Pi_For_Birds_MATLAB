
a=dir(['F:\Documents\MATLAB\Pi_Mangeoire\Images\ ' '/*.jpg'])
out=size(a,1)

for iteration=1:out
    
    filename=['F:\Documents\MATLAB\Pi_Mangeoire\Images\picture_' int2str(iteration) '.jpg'];
    New_Filename=['F:\Documents\MATLAB\Pi_Mangeoire\Compress_Images\picture_' int2str(iteration) '.jpg'];
    A = imread(filename);
    
    imwrite(A,New_Filename,'jpg','quality',50);
 
end


