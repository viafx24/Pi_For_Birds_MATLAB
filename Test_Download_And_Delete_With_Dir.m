

Bitrate='2M'
Remove_Seconds = '5'


Dir_Video=dir('\\BOX\CleMichel\USB_Cam_Mangeoire\Video\');
Dir_Video=Dir_Video(~ismember({Dir_Video.name},{'.','..'}));


while 1
    
    if length(Dir_Video) > 2
        tic
        for i=1:length(Dir_Video)-1
            
            Name=Dir_Video(i).name;
            Filename_On_Box =[ '\\BOX\CleMichel\USB_Cam_Mangeoire\Video\' Name];
            Filename_On_Matlab =[ 'D:\MATLAB_DATA\Data_Pi_Mangeoire\Video\' Name];
            Command=['ffmpeg -hide_banner -loglevel error -i ', Filename_On_Box,  ' -ss ',  Remove_Seconds, '  -c:v copy ', Filename_On_Matlab, ' -y' ];
            system(Command);
            String=[Name, ' downloaded.'];
            disp(String)
            delete(Filename_On_Box);
            String=[Name, ' deleted on box.'];
            disp(String)
            
        end
        toc
        
        !(for %i in (D:\MATLAB_DATA\Data_Pi_Mangeoire\Video\*.mp4) do @echo file '%i') > D:\MATLAB_DATA\Data_Pi_Mangeoire\list.txt
        
        tic
        Command='ffmpeg  -hwaccel cuda  -f concat -safe 0 -i D:\MATLAB_DATA\Data_Pi_Mangeoire\list.txt -c:v h264_nvenc -b:v 1M D:\MATLAB_DATA\Data_Pi_Mangeoire\Video\Concat_Video_1.mp4 -y';
        system(Command);
        toc
        tic
        Command=['ffmpeg  -hwaccel cuda  -f concat -safe 0 -i D:\MATLAB_DATA\Data_Pi_Mangeoire\list.txt -c:v h264_nvenc -b:v ',Bitrate, ' D:\MATLAB_DATA\Data_Pi_Mangeoire\Video\Concat_Video_2.mp4 -y'];
        system(Command);
        toc
        tic
        Command='ffmpeg  -hwaccel cuda  -f concat -safe 0 -i D:\MATLAB_DATA\Data_Pi_Mangeoire\list.txt -c:v copy D:\MATLAB_DATA\Data_Pi_Mangeoire\Video\Concat_Video_3.mp4 -y';
        system(Command);
        toc
        
        if isfile('D:\MATLAB_DATA\Data_Pi_Mangeoire\Video\Concat_Video.mp4')
            fid = fopen('D:\MATLAB_DATA\Data_Pi_Mangeoire\list.txt');
            
            while ~feof(fid)
                line_in = fgets(fid);
                Name=line_in(length(line_in)-17:length(line_in)-3);
                
                Filename_On_Matlab =[ 'D:\MATLAB_DATA\Data_Pi_Mangeoire\Video\' Name];
                
                try
                    delete(Filename_On_Matlab)
                    disp([Filename_On_Matlab ' Downloaded and Deleted']);
                catch
                    disp("problem deleting videos on matlab")
                end
                
            end
            
            movefile D:\MATLAB_DATA\Data_Pi_Mangeoire\Video\Concat_Video.mp4 D:\MATLAB_DATA\Data_Pi_Mangeoire\Video\video_00000.mp4
        end
        toc
        
    end
    
    Dir_Video=dir('\\BOX\CleMichel\USB_Cam_Mangeoire\Video\');
    Dir_Video=Dir_Video(~ismember({Dir_Video.name},{'.','..'}));
    %!(for %i in (D:\MATLAB_DATA\Data_Pi_Mangeoire\Video\*.mp4) do @echo file '%i') > D:\MATLAB_DATA\Data_Pi_Mangeoire\list.txt
    
    if length(Dir_Video)>1   
        disp([int2str(length(Dir_Video)-1) ' videos to download'])
    else
        disp('Waiting for new videos to download')
    end
    
    pause(5);
    
end