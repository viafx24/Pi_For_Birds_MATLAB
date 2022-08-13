% D = 'F:\Documents\MATLAB\Pi_Mangeoire\Video\';
% S = dir(fullfile(D,'*.mp4')); % specify the file extension to exclude directories
% fileID= fopen('F:\Documents\MATLAB\Pi_Mangeoire\Video\list.txt','w');
% 
% fprintf(fileID,'%s\n',S.name)
% fclose(fid);

%!(for %i in ('F:\Documents\MATLAB\Pi_Mangeoire\Video\*.mp4') do @echo file '%i') > 'F:\Documents\MATLAB\Pi_Mangeoire\Video\list.txt'
%command='ffmpeg -f concat -safe 0 -i 'F:\Documents\MATLAB\Pi_Mangeoire\Video\list.txt' -c copy Full_Video.mp4';
!ffmpeg -f concat -safe 0 -i F:\Documents\MATLAB\Pi_Mangeoire\Video\list.txt -c copy F:\Documents\MATLAB\Pi_Mangeoire\Video\Full_Video.mp4

%fileID = fopen('exp.txt','w');
% fprintf(fileID,'%6s %12s\n','x','exp(x)');
% fprintf(fileID,'%6.2f %12.8f\n',A);
% fclose(fileID);