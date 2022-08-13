close all force;
clear all force;

mypi=raspi('192.168.1.21','pi','cardyna!');
%opts = setvaropts(opts,varname,'InputFormat','MM/dd/uuuu HH:mm:ss'); % ajouter pour supprimer un warning.

Image_Folder='F:\Documents\MATLAB\Pi_Mangeoire\Images\';

Frequence_Download_Movies=1;

if isfile('F:\Documents\MATLAB\Pi_Mangeoire\Video\video_0000.mp4')
    
    Name_Backup=['F:\Documents\MATLAB\Pi_Mangeoire\Backup\' sprintf('Backup_%s.mp4', datestr(now,'dd-mm-yyyy HH-MM'))];
    status = copyfile('F:\Documents\MATLAB\Pi_Mangeoire\Video\video_0000.mp4',Name_Backup);
    if status==1
        disp('Backup done');
    end
end
prompt = 'Are you sure you want to delete all videos? Y/N [Y]: ';
str = input(prompt,'s');
if isempty(str)
    str = 'Y';
end
if str=='Y' || str=='y'
    delete('F:\Documents\MATLAB\Pi_Mangeoire\Video\*.mp4');
    disp('all mp4 have been deleted')
end


Handle = gobjects(0);
f = figure();
f.WindowState = 'maximized';

tiledlayout(2,3);
ax1=nexttile;
h1=plot(datetime,NaN,'-+b');
ylabel('Voltage')
xlabel('Time')
ax2=nexttile;
hold on;
h2=plot(datetime,NaN,'-+r');
h3=plot(datetime,NaN,'-+g');
ylabel('Current')
xlabel('Time')
ax3=nexttile;
h4=plot(datetime,NaN,'-+b');
ylabel('PIR')
xlabel('Time')
ax4=nexttile;
h5=plot(datetime,NaN,'-+r');
ylabel('Relative light unit')
xlabel('Time')

ax5=nexttile;
hold on;
h6=plot(datetime,NaN,'-+b');
h7=plot(datetime,NaN,'-or');
%h8=plot(NaN,NaN,'-+g');
ylabel('Numbers of Photos')
xlabel('Time')

% ax6=nexttile;
% A=ones(1080,1920,3);
% h8 = imshow(A);

iteration=1;

while 1
    
    
    getFile(mypi,'/home/pi/Documents/Python/Pi_Mangeoire_Python/Data_Ina219.txt')
    opts = detectImportOptions('Data_Ina219.txt'); % to avoid a datetime format warning
    opts = setvaropts(opts,{'Var1'},'InputFormat','dd/MM/uuuu HH:mm:ss'); % to avoid a datetime format warning
    Data=readtable('Data_Ina219.txt',opts);
    h1.XData=Data.Var1;
    h1.YData=Data.Var7;
    
    h2.XData=Data.Var1;
    h2.YData=Data.Var8;
    
    h3.XData=Data.Var1;
    h3.YData=Data.Var10;
    
    h4.XData=Data.Var1;
    h4.YData=Data.Var16;
    
    h5.XData=Data.Var1;
    h5.YData=Data.Var11;
    
    h6.XData=Data.Var1;
    h6.YData=Data.Var3;
    
    h7.XData=Data.Var1;
    h7.YData=Data.Var4;
    
    
    t1 = datetime('now');
    m = minute(t1);
    
    %     if mod(m,Frequence_Download_Movies)==0
    command='find /home/pi/Documents/Pictures/USB_Cam_Mangeoire -mindepth 1  -maxdepth 1 -type f -name "*.mp4" -printf x | wc -c';
    if str2double(system(mypi,command))> 0
        disp('New video detected, wait 30 seconds before downloading');
        pause(180);
        Get_Video(mypi);
        close(Handle)
        Handle=Launch_Video();

    end

    drawnow;
    pause(5);
    iteration=iteration+1;
    
end








function Get_Video(mypi)

try
    getFile(mypi,'/home/pi/Documents/Pictures/USB_Cam_Mangeoire/*.mp4','F:\Documents\MATLAB\Pi_Mangeoire\Video')
catch
    disp('probably no new video');
end
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

end


function Handle=Launch_Video

if isfile('F:\Documents\MATLAB\Pi_Mangeoire\Video\video_0000.mp4')
    
    Handle = implay('F:\Documents\MATLAB\Pi_Mangeoire\Video\video_0000.mp4');
    Handle.Parent.WindowState= 'maximized' ;
end

end