

!(for %i in (\\BOX\CleMichel\USB_Cam_Mangeoire\Video\*.mp4) do @echo file '%i') > \\BOX\CleMichel\USB_Cam_Mangeoire\list.txt
!ffmpeg -f concat -safe 0 -i \\BOX\CleMichel\USB_Cam_Mangeoire\list.txt -c copy \\BOX\CleMichel\USB_Cam_Mangeoire\Video\Full_Video.mp4


!ffmpeg -f concat -safe 0 -i \\BOX\CleMichel\USB_Cam_Mangeoire\list.txt -c:v libx265 \\BOX\CleMichel\USB_Cam_Mangeoire\Video\Full_h265_Video.mp4


!ffmpeg -i \\BOX\CleMichel\USB_Cam_Mangeoire\Video\video_00001.mp4 -c:v libx265 -vtag hvc1 -c:a copy \\BOX\CleMichel\USB_Cam_Mangeoire\Video\video_00001_h265.mp4

!ffmpeg -i \\BOX\CleMichel\USB_Cam_Mangeoire\Video\video_00001.mp4 -c:v libx264 -crf 25 -preset veryslow -c:a copy F:\Documents\MATLAB\Pi_Mangeoire\Full_Video.mp4 -y


!ffmpeg -f concat -safe 0 -i \\BOX\CleMichel\USB_Cam_Mangeoire\list.txt -c:v libx264 -crf 30 -c:a copy F:\Documents\MATLAB\Pi_Mangeoire\Full_Video_H264.mp4

!ffmpeg -i \\BOX\CleMichel\USB_Cam_Mangeoire\Video\video_00001.mp4 -c:v libx264 -crf 23 -c:a copy \\BOX\CleMichel\USB_Cam_Mangeoire\Video\video_Full_h264_crf23.mp4


!ffmpeg -hwaccel cuda -hwaccel_output_format cuda -i \\BOX\CleMichel\USB_Cam_Mangeoire\Video\video_00574.mp4 -c:v h264_nvenc \\BOX\CleMichel\USB_Cam_Mangeoire\Video\\video_00574_GPU.mp4

!ffmpeg -y -vsync 0 -hwaccel cuda -hwaccel_output_format cuda -i \\BOX\CleMichel\USB_Cam_Mangeoire\Video\video_00001.mp4 -c:a copy -c:v h264_nvenc -b:v 5M -preset slow \\BOX\CleMichel\USB_Cam_Mangeoire\Video\\video_00574_GPU.mp4

!ffmpeg.exe -vsync 0 -hwaccel cuda -i \\BOX\CleMichel\USB_Cam_Mangeoire\Video\video_00001.mp4 -map 0  -c:a copy -c:v h264_nvenc -pix_fmt yuv420p -preset hq \\BOX\CleMichel\USB_Cam_Mangeoire\Video\\video_00001_GPU.mp4