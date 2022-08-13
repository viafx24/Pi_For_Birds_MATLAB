close all;
clear all;
if isequal(exist('mypi','var'),0)
    mypi=raspi('192.168.1.21','pi','cardyna!');
end

%pause(2);

%Command_Linux='python /home/pi/Documents/Ina219/Ina219.py 0.01 1 &'
%Command_Linux='/home/pi/Documents/Ina219/./Bash_Script_For_Matlab_Background.sh &';
%system(mypi,Command_Linux,'sudo');

%j = batch('system',0,{mypi,'/home/pi/Documents/Ina219/./Bash_Script_For_Matlab_Background.sh &'});% ne fonctionne pas avec system

%pause(10);



f=figure;
tiledlayout(2,2);
ax1=nexttile;
h1=plot(NaN,NaN,'-+b');
ylabel('Raspi Voltage')
xlabel('Time')
ax2=nexttile;
h2=plot(NaN,NaN,'-+r');
ylabel('Raspi Current')
xlabel('Time')
ax3=nexttile;
h3=plot(NaN,NaN,'-+b');
ylabel('Solar Panel Voltage')
xlabel('Time')
ax4=nexttile;
h4=plot(NaN,NaN,'-+r');
ylabel('Solar Panel Current')
xlabel('Time')


getFile(mypi,'/home/pi/Documents/Python/Pi_Mangeoire_Python/Data_Ina219.txt')
Data=readtable('Data_Ina219.txt');
h1.XData=1:length(Data.Var4);
h1.YData=Data.Var4;

h2.XData=1:length(Data.Var5);
h2.YData=Data.Var5;

h3.XData=1:length(Data.Var6);
h3.YData=Data.Var6;

h4.XData=1:length(Data.Var7);
h4.YData=Data.Var7;

drawnow;
