close all;
clear all;
mypi=raspi('192.168.1.21','pi','cardyna!');

Image_Folder='F:\Documents\MATLAB\Pi_Mangeoire\Images\';

Current_Number_Of_Photo=0;
Max_Number_Of_Photo=5001;

Frequence_Download_Pictures=1;

Frequence_Mount_Movie=2;

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



while Current_Number_Of_Photo < Max_Number_Of_Photo
    
    getFile(mypi,'/home/pi/Documents/Python/Pi_Mangeoire_Python/Data_Ina219.txt')
    Data=readtable('Data_Ina219.txt');
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
    
    if mod(m,Frequence_Download_Pictures)==0
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


function Launch_Video

a=dir(['F:\Documents\MATLAB\Pi_Mangeoire\Images\ ' '/*.jpg'])
out=size(a,1)

tic
v = VideoWriter('F:\Documents\MATLAB\Pi_Mangeoire\Video\Main_Video.mp4','MPEG-4');
%v.Quality = 100;% 56 mega for 250 photo. with default, 25mega. default
%looks ok.

open(v)


for iteration=1:out
    
    filename=['F:\Documents\MATLAB\Pi_Mangeoire\Images\picture_' int2str(iteration) '.jpg'];
    A = imread(filename);
    writeVideo(v,A)
end
close(v)  

toc

handle = implay('F:\Documents\MATLAB\Pi_Mangeoire\Video\Main_Video.mp4');
handle.Parent.WindowState= 'maximized' ;

end