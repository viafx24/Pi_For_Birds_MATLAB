
% !ffmpeg -t 3600 -i http://admin:cardyna!1025@192.168.1.98:8080/audio.aac D:\MATLAB_DATA\Daya_IPCAM\Test_Audio.aac
% 
% 
% !ffmpeg -t 30 -i http://admin:cardyna!1025@192.168.1.98:8080/video D:\MATLAB_DATA\Daya_IPCAM\Test_Video.mp4

%Ligne qui fonctionne pas mal je crois avec smartphone

!ffmpeg -rtsp_transport tcp  -y -t 60 -r 5 -i rtsp://admin:cardyna!1025@192.168.1.98:8080/h264_ulaw.sdp  D:\MATLAB_DATA\Daya_IPCAM\Test_Conso_SMARTPHONE.mp4

% ligne qui fonctionne pas mal avec camera ip je crois;
%!ffmpeg -y -t 90 -i rtsp://192.168.1.20:554/user=admin_password=cardyna!1024_channel=0_stream=0.sdp?real_stream -vcodec copy  D:\MATLAB_DATA\Daya_IPCAM\Test_FFmpeg\Test_Cam_IP_Sound.avi



%cam = ipcam('http://192.168.1.98:8080/video','admin','cardyna!1025')

%Picture= ipcam('http://192.168.1.98:8080/audio.wav','admin','cardyna!1025');

% !ffmpeg -y -rtsp_transport tcp -use_wallclock_as_timestamps 1 -i rtsp://192.168.1.20:554/user=admin_password=cardyna!1024_channel=0_stream=0.sdp?real_stream -vcodec copy -acodec copy -f segment -reset_timestamps 1 -segment_time 30 -segment_format mkv -segment_atclocktime 1 -strftime 1 Test_FFmpeg.mkv


%!ffmpeg -y -rtsp_transport tcp  -i rtsp://192.168.1.20:554/user=admin_password=cardyna!1024_channel=0_stream=0.sdp?real_stream -vcodec copy -acodec copy -map 0 -f segment -segment_time 30 -segment_format mkv -segment_atclocktime 1 -strftime 1 D:\MATLAB_DATA\Daya_IPCAM\Test_FFmpeg.mkv


% !ffmpeg -y -rtsp_transport tcp  -i rtsp://192.168.1.20:554/user=admin_password=cardyna!1024_channel=0_stream=0.sdp?real_stream -vcodec copy  -f segment -segment_time 30 -reset_timestamps 1 -strftime 1 D:\MATLAB_DATA\Daya_IPCAM\Test_FFmpeg\Test_FFmpeg.mkv
%!ffmpeg -y -t 30 -i rtsp://192.168.1.20:554/user=admin_password=cardyna!1024_channel=0_stream=0.sdp?real_stream -vcodec copy  -acodec copy D:\MATLAB_DATA\Daya_IPCAM\Test_FFmpeg\Test_FFmpeg.avi


%!ffmpeg -y -t 30 -i rtsp://192.168.1.20:554/user=admin_password=cardyna!1024_channel=0_stream=0.sdp?real_stream -vcodec copy  -an D:\MATLAB_DATA\Daya_IPCAM\Test_FFmpeg\Test_FFmpeg.avi




% !ffmpeg  -rtsp_transport tcp -i rtsp://192.168.1.20:554/user=admin_password=cardyna!1024_channel=0_stream=0.sdp?real_stream -c:v copy -an D:\MATLAB_DATA\Daya_IPCAM\Test_FFmpeg.mp4 -y


% -c:v libx264 -crf 25 -preset veryslow -c:a copy F:\Documents\MATLAB\Pi_Mangeoire\Full_Video.mp4 -y

% for i=1:50
%     Cam = webread('http://192.168.1.20/webcapture.jpg?user=admin&password=cardyna!1024&command=snap&channel=1','admin','cardyna!1024');
%     %pause(0.1)
%     imshow(Cam)
% end
% 























%imwrite(Cam,'myGray.png')

%Cam = ipcam('http://192.168.1.20/webcapture.jpg?user=admin&password=cardyna!1024&command=snap&channel=1')

%Cam = ipcam('http://192.168.1.20/snapshot.cgi?user=admin&password=cardyna!1024&command=snap&channel=1','admin','cardyna!1024')


% Cam = ipcam(

% rtsp://admin:cardyna!1024@
% img = snapshot(Cam);
%  Name=[PooledName num2str(i) '.jpeg'];
%  imwrit%Cam = ipcam('http://192.168.0.16:13901/videostream.cgi','via_fx_24','tDKDyFbppg55ZyNY');
%Cam = ipcam('rtsp://192.168.1.20:554/user=admin_password=cardyna!1024_channel=0_stream=0.sdp','admin','cardyna!1024');

%Cam = ipcam('rtsp://192.168.1.20:554/user=admin_password=cardyna!1024_channel=0_stream=0.sdp');

% Cam = ipcam('rtsp://admin:cardyna!1024@192.168.1.20:554/user=admin_password=cardyna!1024_channel=0_stream=0.sdp?real_stream','admin','cardyna!1024')

%Cam = ipcam('http://192.168.1.20:34567/video.cgi','admin','cardyna!1024')

%Cam = webread('http://192.168.1.20/webcapture.jpg?user=admin&password=cardyna!1024&command=snap&channel=1','admin','cardyna!1024')


% Cam =webread('http://192.168.1.20/webcapture.jpg?user=admin&password=cardyna!1024&command=snap&channel=0');
% imshow(Cam)e(img,Name,'Quality',75);