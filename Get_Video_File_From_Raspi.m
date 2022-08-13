clear all
mypi=raspi('192.168.1.21','pi','cardyna!');


getFile(mypi,'/home/pi/Documents/Pictures/USB_Cam_Mangeoire/*.mp4','F:\Documents\MATLAB\Pi_Mangeoire\Video')

!(for %i in (F:\Documents\MATLAB\Pi_Mangeoire\Video\*.mp4) do @echo file '%i') > F:\Documents\MATLAB\Pi_Mangeoire\Video\list.txt
!ffmpeg -f concat -safe 0 -i F:\Documents\MATLAB\Pi_Mangeoire\Video\list.txt -c copy F:\Documents\MATLAB\Pi_Mangeoire\Video\Full_Video.mp4

if isfile('F:\Documents\MATLAB\Pi_Mangeoire\Video\Full_Video.mp4')
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
    
    movefile F:\Documents\MATLAB\Pi_Mangeoire\Video\Full_Video.mp4 F:\Documents\MATLAB\Pi_Mangeoire\Video\video_0000.mp4
else
    disp('probable problem with ffmpeg command line')
end
