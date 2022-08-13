
!FORFILES /M *.mp4 /c "cmd /c ffmpeg -ss 30 -i ^"@file^" -c copy ^"done\\@file^""

!ffmpeg -i D:\MATLAB_DATA\Data_Pi_Mangeoire\video_00002.mp4 -ss 5 -c:v copy  D:\MATLAB_DATA\Data_Pi_Mangeoire\video_concat_GPU.mp4 -y

!ffmpeg  -hwaccel cuda  -f concat -safe 0 -i D:\MATLAB_DATA\Data_Pi_Mangeoire\list.txt -c:v h264_nvenc -b:v 0.5M  D:\MATLAB_DATA\Data_Pi_Mangeoire\video_concat_GPU.mp4 -y

!(for %i in (D:\MATLAB_DATA\Data_Pi_Mangeoire\*.mp4) do @echo file '%i') > D:\MATLAB_DATA\Data_Pi_Mangeoire\list.txt

!ffmpeg -i \\BOX\CleMichel\USB_Cam_Mangeoire\Video\video_00596.mp4 -c:v h264_nvenc -b:v 0.5M -an \\BOX\CleMichel\USB_Cam_Mangeoire\Video\full_video_GPU.mp4

!ffmpeg  -hwaccel cuda  -f concat -safe 0 -i \\BOX\CleMichel\USB_Cam_Mangeoire\list.txt -c:v h264_nvenc -b:v 0.05M -an \\BOX\CleMichel\USB_Cam_Mangeoire\Video\video_concat_GPU.mp4 -y

% !ffmpeg  -hwaccel cuda  -f concat -safe 0 -i \\BOX\CleMichel\USB_Cam_Mangeoire\list.txt -c:v h264_nvenc -b:v 0.5M F:\Documents\MATLAB\Pi_Mangeoire\video_concat_GPU.mp4 -y
% !ffmpeg  -hwaccel cuda  -f concat -safe 0 -i \\BOX\CleMichel\USB_Cam_Mangeoire\list.txt -c:v h264_nvenc -b:v 0.5M \\BOX\CleMichel\USB_Cam_Mangeoire\Video\video_concat_GPU.mp4 -y