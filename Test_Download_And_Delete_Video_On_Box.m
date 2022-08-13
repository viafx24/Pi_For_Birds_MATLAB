!(for %i in (\\BOX\CleMichel\USB_Cam_Mangeoire\Video\*.mp4) do @echo file '%i') > \\BOX\CleMichel\USB_Cam_Mangeoire\list.txt

fid = fopen('\\BOX\CleMichel\USB_Cam_Mangeoire\list.txt','r');
% fseek(fid, 0, 'eof');
% chunksize = ftell(fid);
% fseek(fid, 0, 'bof');
% ch = fread(fid, chunksize, '*uchar');
% k = sum(ch == sprintf('\n')) % k is number of lines
% 
% fseek(fid, 0, 'bof');
%for i=1:k
tic
while ~feof(fid)    
    line_in = fgets(fid);
    Name=line_in(length(line_in)-17:length(line_in)-3);
    Filename_On_Box =[ '\\BOX\CleMichel\USB_Cam_Mangeoire\Video\' Name];
    Filename_On_Matlab =[ 'D:\MATLAB_DATA\Data_Pi_Mangeoire\' Name];

    Command=['ffmpeg -i ', Filename_On_Box,  ' -ss 5 -c:v copy ', Filename_On_Matlab ]
    system(Command)
%     pause
%     
%     yourfolder = '\\BOX\CleMichel\USB_Cam_Mangeoire\Video\';
%     a = dir(fullfile(yourfolder, '*.mp4'));
    
    %delete(Filename_On_Box)
end
toc

% while ~feof(fid)
%     line_in = fgets(fid);
%     Name=line_in(length(line_in)-16:length(line_in)-3);
%     Filename_On_Box =[ '\\BOX\CleMichel\USB_Cam_Mangeoire\Video\' Name];
%     Filename_On_Matlab =[ 'F:\Documents\MATLAB\Pi_Mangeoire\Video\' Name];
%     try
%         deleteFile(mypi,Filename_Raspi);
%     catch
%         disp("problem deleting videos on raspi")
%     end
%     disp([Filename_Raspi ' Downloaded and Deleted']);
%     try
%         delete(Filename_On_Matlab)
%     catch
%         disp("problem deleting videos on matlab")
%     end
%     disp([Filename_On_Matlab ' Downloaded and Deleted']);
%     
% end