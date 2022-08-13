close all;
clear all;
if isequal(exist('mypi','var'),0)
    mypi=raspi('192.168.1.21','pi','cardyna!');
end

iteration=10000;
Length_To_Show=100;

f=figure;
tiledlayout(2,2);
ax1=nexttile;
h1=plot(NaN,NaN,'-+b');
ylabel('X')
xlabel('Time')
ax2=nexttile;
h2=plot(NaN,NaN,'-+r');
ylabel('Y')
xlabel('Time')
ax3=nexttile;
h3=plot(NaN,NaN,'-+b');
ylabel('Z')
xlabel('Time')
ax4=nexttile;
% h4=plot(NaN,NaN,'-+r');
% ylabel('Solar Panel Current')
% xlabel('Time')

for i=1:iteration
    getFile(mypi,'/home/pi/Documents/Python/Pi_Mangeoire_Python/Data_Ina219.txt')
    Data=readtable('Data_Ina219.txt');
    
    h1.XData=1:Length_To_Show;
    h1.YData=Data.Var9(end-Length_To_Show+1:end);

    h2.XData=1:Length_To_Show;
    h2.YData=Data.Var10(end-Length_To_Show+1:end);

    h3.XData=1:Length_To_Show;
    h3.YData=Data.Var11(end-Length_To_Show+1:end);
      
    drawnow;
%    pause(1);
end

