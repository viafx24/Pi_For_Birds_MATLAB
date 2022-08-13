% A simplify version that only consist to download the video on the
% computer and extract the sound in different folder. No compression.
% and no analyze yet.

%% Main parameters

Bitrate='0.5M';
HD = true;
Audio = true;

Minimal_Number_Of_Video = 1;

%% scripts

tic

Dir_Video_remote=dir('\\BOX\CleMichel\USB_Cam_Mangeoire\Video_Secteur\');
Dir_Video_remote=Dir_Video_remote(~ismember({Dir_Video_remote.name},{'.','..'}));
disp([int2str(length(Dir_Video_remote)-1) ' videos ready to be to downloaded'])

f = waitbar(0,'Please wait...');

for iteration = 1 : length(Dir_Video_remote)-1
    
% %     Dir_Video=dir('\\BOX\CleMichel\USB_Cam_Mangeoire\Video_Secteur\');
% %     Dir_Video=Dir_Video(~ismember({Dir_Video.name},{'.','..'}));
       
    Name=Dir_Video_remote(iteration).name;
    Filename_On_Box =[ '\\BOX\CleMichel\USB_Cam_Mangeoire\Video_Secteur\' Name];
    
%     Name_On_Matlab=Dir_Video(i).date;
    Name_On_Matlab=datestr(datetime(Dir_Video_remote(iteration).datenum,'ConvertFrom','datenum'));% to allow date in english (Août generate problem)
    
    Name_On_Matlab = strrep(Name_On_Matlab,'.','');
    Name_On_Matlab = strrep(Name_On_Matlab,' ','_');
    Name_On_Matlab = strrep(Name_On_Matlab,':','-');
    Name_On_Matlab=[Name_On_Matlab '.mp4'];
    
    
    Filename_On_Matlab =[ 'D:\MATLAB_DATA\Data_Jardin\Pi_Noir\Video_HD\' Name_On_Matlab];
    
    try
        movefile(Filename_On_Box,Filename_On_Matlab);
    catch error
        error("Still problem to delete a file on the box, probably")
    end
    
    String=[Name, ' downloaded and deleted from box.'];
    disp(String);
    
    if Audio == true && HD == true
        
        
        Dir_Video_local=dir('D:\MATLAB_DATA\Data_Jardin\Pi_Noir\Video_HD\');
        Dir_Video_local=Dir_Video_local(~ismember({Dir_Video_local.name},{'.','..'}));
        
        Name_Audio=['Track_' Name_On_Matlab(1:end-4) '.aac'];
        
        
        Command=['ffmpeg -hide_banner -loglevel error -i D:\MATLAB_DATA\Data_Jardin\Pi_Noir\Video_HD\' Name_On_Matlab ' -vn -acodec copy D:\MATLAB_DATA\Data_Jardin\Pi_Noir\Audio\' Name_Audio ' -y'];
        
        
        system(Command);
        
        disp([Name_Audio ' correctly created']);
    end
    
 waitbar(iteration/(length(Dir_Video_local)-1),f,'Please wait...');   
    
end

toc;

Dir_Video_Remote=dir('\\BOX\CleMichel\USB_Cam_Mangeoire\Video_Secteur\');
Dir_Video_Remote=Dir_Video_Remote(~ismember({Dir_Video_Remote.name},{'.','..'}));

disp([int2str(length(Dir_Video_Remote)-1) ' videos to download'])

Dir_Video_HD=dir('D:\MATLAB_DATA\Data_Jardin\Pi_Noir\Video_HD\');
Dir_Video_HD=Dir_Video_HD(~ismember({Dir_Video_HD.name},{'.','..'}));
String=[ int2str(length(Dir_Video_HD)) ' in the Video_HD folder.'];
disp(String)

Dir_Audio=dir('D:\MATLAB_DATA\Data_Jardin\Pi_Noir\Audio\');
Dir_Audio=Dir_Audio(~ismember({Dir_Audio.name},{'.','..'}));
String=[ int2str(length(Dir_Audio)) ' in the Audio folder.'];

close(f);
% du to desktop.ini cached file
%String=[ int2str(length(Dir_Audio)-1) ' in the Audio folder.'];% du to desktop.ini cached file
%     disp('pause for 5 seconds');
%     pause(5);


