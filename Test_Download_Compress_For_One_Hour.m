

Bitrate='0.1M'
Remove_Seconds = '5'
Minimal_Number_Of_Video = 10

Dir_Video=dir('\\BOX\CleMichel\USB_Cam_Mangeoire\Video\');
Dir_Video=Dir_Video(~ismember({Dir_Video.name},{'.','..'}));
disp([int2str(length(Dir_Video)-1) ' videos ready to be to downloaded'])

while 1
    
    if length(Dir_Video) > Minimal_Number_Of_Video
        tic
        for i=1:Minimal_Number_Of_Video
            
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
        
        
        Dir_Video_HD=dir('D:\MATLAB_DATA\Data_Pi_Mangeoire\Video_HD\');
        Dir_Video_HD=Dir_Video_HD(~ismember({Dir_Video_HD.name},{'.','..'}));
        
        Iteration_Video_Hour = length(Dir_Video_HD) + 1;
        Name_HD=['video_HD_' num2str(Iteration_Video_Hour,'%05.f') '.mp4'];
        Command=['ffmpeg -f concat -safe 0 -i D:\MATLAB_DATA\Data_Pi_Mangeoire\list.txt -c:v copy D:\MATLAB_DATA\Data_Pi_Mangeoire\Video_HD\' Name_HD ' -y']
        
        tic
        system(Command);
        toc
        
        Dir_Video_LD=dir('D:\MATLAB_DATA\Data_Pi_Mangeoire\Video_LD\');
        Dir_Video_LD=Dir_Video_LD(~ismember({Dir_Video_LD.name},{'.','..'}));
        Iteration_Video_Hour = length(Dir_Video_LD) + 1;
        Name_LD=['video_LD_' num2str(Iteration_Video_Hour,'%05.f') '.mp4'];
        Command=['ffmpeg  -hwaccel cuda  -f concat -safe 0 -i D:\MATLAB_DATA\Data_Pi_Mangeoire\list.txt -c:v h264_nvenc -b:v ',Bitrate, ' -an D:\MATLAB_DATA\Data_Pi_Mangeoire\Video_LD\' Name_LD ' -y']
        
        tic
        system(Command);
        toc
        
        
        Dir_Audio=dir('D:\MATLAB_DATA\Data_Pi_Mangeoire\Audio\');
        Dir_Audio=Dir_Audio(~ismember({Dir_Audio.name},{'.','..'}));
        disp(length(Dir_Audio))
        Iteration_Video_Hour = length(Dir_Audio) %+ 1; % I remove the +1 because of a desktop.ini file created automatically 
        Name_Audio=['Track_' num2str(Iteration_Video_Hour,'%05.f') '.aac'];
        Command=['ffmpeg  -i D:\MATLAB_DATA\Data_Pi_Mangeoire\Video_HD\' Name_HD ' -vn -acodec copy D:\MATLAB_DATA\Data_Pi_Mangeoire\Audio\' Name_Audio ' -y']
        
        tic
        system(Command);
        toc
        
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
        
    end
    
    
    Dir_Video=dir('\\BOX\CleMichel\USB_Cam_Mangeoire\Video\');
    Dir_Video=Dir_Video(~ismember({Dir_Video.name},{'.','..'}));
    
    disp([int2str(length(Dir_Video)-1) ' videos to download'])
    
    if length(Dir_Video) < Minimal_Number_Of_Video
        disp('Waiting for minimum number of videos to download')
    end
    
    pause(10);
    
end