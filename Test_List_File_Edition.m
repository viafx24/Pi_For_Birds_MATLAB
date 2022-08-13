

!(for %i in (\\BOX\CleMichel\USB_Cam_Mangeoire\Video\*.mp4) do @echo file '%i') > \\BOX\CleMichel\USB_Cam_Mangeoire\list.txt


fid = fopen('\\BOX\CleMichel\USB_Cam_Mangeoire\list.txt','r');
fseek(fid, 0, 'eof');

chunksize = ftell(fid);
fseek(fid, 0, 'bof');
ch = fread(fid, chunksize, '*uchar');
k = sum(ch == sprintf('\n')) % k is number of lines 
fclose(fid);

tic
if k>20
    
     !ffmpeg  -hwaccel cuda  -f concat -safe 0 -i \\BOX\CleMichel\USB_Cam_Mangeoire\list.txt -c:v h264_nvenc -b:v 1M  D:\MATLAB_DATA\Data_Pi_Mangeoire\video_concat_GPU.mp4 -y

end
toc

%!sed '$d' \\BOX\CleMichel\USB_Cam_Mangeoire\pre_list.txt > \\BOX\CleMichel\USB_Cam_Mangeoire\list.txt

%  fid = fopen('\\BOX\CleMichel\USB_Cam_Mangeoire\list.txt', 'r') ;              % Open source file.
%  fgetl(fid) ;                                  % Read/discard line.
%  fgetl(fid) ;                                  % Read/discard line.
%  buffer = fread(fid, Inf) ;                    % Read rest of the file.
%  fclose(fid)
%  fid = fopen('myFile_truncated.txt', 'w')  ;   % Open destination file.
%  fwrite(fid, buffer) ;                         % Save to file.
%  fclose(fid) ;