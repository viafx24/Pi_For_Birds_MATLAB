close all force;
clear all force;

Bitrate='2M'
Remove_Seconds = '5'

% if isfile('F:\Documents\MATLAB\Pi_Mangeoire\Video\video_0000.mp4')
%     
%     Name_Backup=['F:\Documents\MATLAB\Pi_Mangeoire\Backup\' sprintf('Backup_%s.mp4', datestr(now,'dd-mm-yyyy HH-MM'))];
%     status = copyfile('F:\Documents\MATLAB\Pi_Mangeoire\Video\video_0000.mp4',Name_Backup);
%     if status==1
%         disp('Backup done');
%     end
% end
% prompt = 'Are you sure you want to delete all videos? Y/N [Y]: ';
% str = input(prompt,'s');
% if isempty(str)
%     str = 'Y';
% end
% if str=='Y' || str=='y'
%     delete('F:\Documents\MATLAB\Pi_Mangeoire\Video\*.mp4');
%     disp('all mp4 have been deleted')
% end


Handle = gobjects(0);
f = figure();
f.WindowState = 'maximized';

tiledlayout(2,1);
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

iteration=1;

while 1
    
    opts = detectImportOptions('\\BOX\CleMichel\USB_Cam_Mangeoire\Data_ESP_Session.txt'); % to avoid a datetime format warning
    %opts = detectImportOptions('\\BOX\CleMichel\USB_Cam_Mangeoire\Data_All.txt'); % to avoid a datetime format warning
    opts = setvaropts(opts,{'Var1'},'InputFormat','dd/MM/uuuu HH:mm:ss'); % to avoid a datetime format warning
     Data=readtable('\\BOX\CleMichel\USB_Cam_Mangeoire\Data_ESP_Session.txt',opts);
    %Data=readtable('\\BOX\CleMichel\USB_Cam_Mangeoire\Data_All.txt',opts);
    h1.XData=Data.Var1;
    h1.YData=Data.Var7;
    
    h2.XData=Data.Var1;
    h2.YData=Data.Var8;
    
    h3.XData=Data.Var1;
    h3.YData=Data.Var9;
%     
%     h4.XData=Data.Var1;
%     h4.YData=Data.Var16;
%     
%     h5.XData=Data.Var1;
%     h5.YData=Data.Var11;
%     
%     h6.XData=Data.Var1;
%     h6.YData=Data.Var3;
%     
%     h7.XData=Data.Var1;
%     h7.YData=Data.Var4;
%     
%     
%     t1 = datetime('now');
%     m = minute(t1);
%     
%     %     if mod(m,Frequence_Download_Movies)==0
%     command='find /home/pi/Documents/Pictures/USB_Cam_Mangeoire -mindepth 1  -maxdepth 1 -type f -name "*.mp4" -printf x | wc -c';
%     if str2double(system(mypi,command))> 0
%         disp('New video detected, wait 30 seconds before downloading');
%         pause(180);
%         Get_Video(mypi);
%         close(Handle)
%         Handle=Launch_Video();
% 
%     end

    drawnow;
    pause(5);
    iteration=iteration+1;
    
end








function Download_Delete_And_Compress(Bitrate,Remove_Seconds)


end


function Handle=Launch_Video

if isfile('F:\Documents\MATLAB\Pi_Mangeoire\Video\video_0000.mp4')
    
    Handle = implay('F:\Documents\MATLAB\Pi_Mangeoire\Video\video_0000.mp4');
    Handle.Parent.WindowState= 'maximized' ;
end

end