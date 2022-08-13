close all;
clear all;
mypi=raspi('192.168.1.21','pi','cardyna!');

Image_Folder='F:\Documents\MATLAB\Pi_Mangeoire\Images\';

Current_Number_Of_Photo=0;
Max_Number_Of_Photo=5001;

Frequence_Download=1;



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

ax6=nexttile;
A=ones(1080,1920,3);
h8 = imshow(A);
% filename=['F:\Documents\MATLAB\Pi_Mangeoire\Images\picture_1.jpg'];
% try
% A = imread(filename);
% h8 = imshow(A);
% catch
%     disp('no picture_1.jpg');
% end

while Current_Number_Of_Photo < Max_Number_Of_Photo
    
    getFile(mypi,'/home/pi/Documents/Python/Pi_Mangeoire_Python/Data_Ina219.txt')
    Data=readtable('Data_Ina219.txt');
    h1.XData=Data.Var1;
    h1.YData=Data.Var6;
    
    h2.XData=Data.Var1;
    h2.YData=Data.Var7;
    
    h3.XData=Data.Var1;
    h3.YData=Data.Var9;
    
    h4.XData=Data.Var1;
    h4.YData=Data.Var14;
    
    h5.XData=Data.Var1;
    h5.YData=Data.Var10;
    
    h6.XData=Data.Var1;
    h6.YData=Data.Var3;
    
    h7.XData=Data.Var1;
    h7.YData=Data.Var4;
    
    
    t1 = datetime('now');
    m = minute(t1);
    
    if mod(m,Frequence_Download)==0
        Number_Of_Picture=Data.Var3(end);
        Number_Of_Last_Picture=Data.Var4(end);
        
        
        Filename_Test = ['/home/pi/Documents/Pictures/USB_Cam_Mangeoire/picture_'   num2str(Number_Of_Last_Picture-Number_Of_Picture+1) '.jpg'] ;
        Command_Linux=['ls ' Filename_Test ' >> /dev/null 2>&1 && echo 1 || echo 0'];
        if str2double(system(mypi,Command_Linux))~=0
            tic
            for iteration=1:Number_Of_Picture
                
                Filename = ['/home/pi/Documents/Pictures/USB_Cam_Mangeoire/picture_'  num2str(Number_Of_Last_Picture-Number_Of_Picture+iteration) '.jpg'] ;
                getFile(mypi,Filename,'F:\Documents\MATLAB\Pi_Mangeoire\Images');
                deleteFile(mypi,Filename)
                disp([Filename ' Downloaded and Deleted']);
                
            end
            toc
            
            filename=['F:\Documents\MATLAB\Pi_Mangeoire\Images\picture_' int2str(Number_Of_Last_Picture) '.jpg'];
            A = imread(filename);
            set(h8, 'CData', A);
            
        end
        
    end





drawnow;

a=dir([Image_Folder '/*.jpg']);
Current_Number_Of_Photo=size(a,1);
pause(5);
end
