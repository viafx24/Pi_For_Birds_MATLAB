fid = fopen('F:\Documents\MATLAB\Pi_Mangeoire\Video\list.txt');

while ~feof(fid)
    line_in = fgets(fid);
    Name=line_in(length(line_in)-16:length(line_in)-3);
    
    Filename_Raspi = ['/home/pi/Documents/Pictures/USB_Cam_Mangeoire/' Name] ;
    Filename_On_Matlab =[ 'F:\Documents\MATLAB\Pi_Mangeoire\Video\' Name];
    try
    deleteFile(mypi,Filename_Raspi);
    catch
        disp("problem deleting videos on raspi")
    end
    disp([Filename_Raspi ' Downloaded and Deleted']);
    try
    delete(Filename_On_Matlab)
    catch
        disp("problem deleting videos on matlab")
    end
    disp([Filename_On_Matlab ' Downloaded and Deleted']);
    
end

% line_in = fgets(fid)
% String_Begin=line_in(length(line_in)-16:length(line_in)-3)
% Begin=str2double(line_in(length(line_in)-10:length(line_in)-7))
% 
% 
% fseek(fid, -20, 'eof')
% line_in = fgets(fid)
% String_End=line_in(length(line_in)-16:length(line_in)-3)
% End=str2double(line_in(length(line_in)-10:length(line_in)-7))
% 
% for iteration=Begin:End
%     
%     line_in = fgets(fid)
%     Name=line_in(length(line_in)-16:length(line_in)-3)
%     
%     Filename = ['/home/pi/Documents/Pictures/USB_Cam_Mangeoire/' Name] ;
% 
%     deleteFile(mypi,Filename)
%     disp([Filename ' Downloaded and Deleted']);
% 
% end