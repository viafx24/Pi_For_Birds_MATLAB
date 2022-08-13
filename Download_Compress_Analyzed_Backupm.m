

%% Main parameters

Bitrate='0.5M';
Remove_Seconds = '5';
HD = true;
LD = true;
Audio = true;

Minimal_Number_Of_Video = 10;

%% scripts

Dir_Video=dir('\\BOX\CleMichel\USB_Cam_Mangeoire\Video\');
Dir_Video=Dir_Video(~ismember({Dir_Video.name},{'.','..'}));


while length(Dir_Video) > Minimal_Number_Of_Video
    
    Dir_Video=dir('\\BOX\CleMichel\USB_Cam_Mangeoire\Video\');
    Dir_Video=Dir_Video(~ismember({Dir_Video.name},{'.','..'}));
    disp([int2str(length(Dir_Video)-1) ' videos ready to be to downloaded'])
          
    if length(Dir_Video) > Minimal_Number_Of_Video
        
        for i=1:Minimal_Number_Of_Video
            
            Name=Dir_Video(i).name;
            Filename_On_Box =[ '\\BOX\CleMichel\USB_Cam_Mangeoire\Video\' Name];
            
            
            Name_On_Matlab=Dir_Video(i).date;
            Name_On_Matlab = strrep(Name_On_Matlab,'.','');
            Name_On_Matlab = strrep(Name_On_Matlab,' ','_');
            Name_On_Matlab = strrep(Name_On_Matlab,':','-');
            Name_On_Matlab=[Name_On_Matlab '.mp4'];
            
            Filename_On_Matlab =[ 'D:\MATLAB_DATA\Data_Pi_Mangeoire\Video\' Name_On_Matlab];
            Command=['ffmpeg -hide_banner -loglevel error -i ', Filename_On_Box,  ' -ss ',  Remove_Seconds, '  -c:v copy ', Filename_On_Matlab, ' -y' ];
            system(Command);
            String=[Name, ' downloaded.'];
            disp(String)
            delete(Filename_On_Box);
            String=[Name, ' deleted on box.'];
            disp(String)
            
        end
        
        
        !(for %i in (D:\MATLAB_DATA\Data_Pi_Mangeoire\Video\*.mp4) do @echo file '%i') > D:\MATLAB_DATA\Data_Pi_Mangeoire\list.txt
        
        if HD == true
            
            Dir_Video=dir('D:\MATLAB_DATA\Data_Pi_Mangeoire\Video\');
            Dir_Video=Dir_Video(~ismember({Dir_Video.name},{'.','..'}));
            Name_HD=['HD_' Dir_Video(1).name];
            
            Command=['ffmpeg -f concat -safe 0 -i D:\MATLAB_DATA\Data_Pi_Mangeoire\list.txt -c:v copy D:\MATLAB_DATA\Data_Pi_Mangeoire\Video_HD\' Name_HD ' -y']
            
            
            system(Command);
            
        end
        
        if LD == true
            
            
            Dir_Video=dir('D:\MATLAB_DATA\Data_Pi_Mangeoire\Video\');
            Dir_Video=Dir_Video(~ismember({Dir_Video.name},{'.','..'}));
            Name_LD=['LD_' Dir_Video(1).name];
            
            
            Command=['ffmpeg  -hwaccel cuda  -f concat -safe 0 -i D:\MATLAB_DATA\Data_Pi_Mangeoire\list.txt  -c:v h264_nvenc -b:v ',Bitrate, ' -an D:\MATLAB_DATA\Data_Pi_Mangeoire\Video_LD\' Name_LD ' -y']
            
            
            system(Command);
            
            
        end
        
        if Audio == true && HD == true
            
            
            Dir_Video=dir('D:\MATLAB_DATA\Data_Pi_Mangeoire\Video\');
            Dir_Video=Dir_Video(~ismember({Dir_Video.name},{'.','..'}));
            
            Name_Audio=['Track_' Dir_Video(1).name(1:end-4) '.aac'];
            
            
            Command=['ffmpeg  -i D:\MATLAB_DATA\Data_Pi_Mangeoire\Video_HD\' Name_HD ' -vn -acodec copy D:\MATLAB_DATA\Data_Pi_Mangeoire\Audio\' Name_Audio ' -y']
            
            
            system(Command);
            
            
        end
        
        
        delete('D:\MATLAB_DATA\Data_Pi_Mangeoire\Video\*')
        disp('Video folder has been deleted');
        
        
    end
    
    Dir_Video=dir('\\BOX\CleMichel\USB_Cam_Mangeoire\Video\');
    Dir_Video=Dir_Video(~ismember({Dir_Video.name},{'.','..'}));
    
    disp([int2str(length(Dir_Video)-1) ' videos to download'])
    
    if length(Dir_Video) < Minimal_Number_Of_Video
        disp('Waiting for minimum number of videos to download')
    end
    
    Dir_Video_HD=dir('D:\MATLAB_DATA\Data_Pi_Mangeoire\Video_HD\');
    Dir_Video_HD=Dir_Video_HD(~ismember({Dir_Video_HD.name},{'.','..'}));
    String=[ int2str(length(Dir_Video_HD)) ' in the Video_HD folder.'];
    disp(String)
    
    Dir_Video_LD=dir('D:\MATLAB_DATA\Data_Pi_Mangeoire\Video_LD\');
    Dir_Video_LD=Dir_Video_LD(~ismember({Dir_Video_LD.name},{'.','..'}));
    String=[ int2str(length(Dir_Video_LD)) ' in the Video_LD folder.'];
    disp(String)
    
    Dir_Audio=dir('D:\MATLAB_DATA\Data_Pi_Mangeoire\Audio\');
    Dir_Audio=Dir_Audio(~ismember({Dir_Audio.name},{'.','..'}));
    String=[ int2str(length(Dir_Audio)) ' in the Audio folder.'];% du to desktop.ini cached file
    %String=[ int2str(length(Dir_Audio)-1) ' in the Audio folder.'];% du to desktop.ini cached file
    disp('pause for 5 seconds');
    pause(5);
    
end


