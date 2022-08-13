close all force;
clear all force;

%%  plotting parameters

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
    
    
    drawnow;
    pause(10);
    iteration=iteration+1;
    
end
