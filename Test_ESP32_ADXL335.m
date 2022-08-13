close all;
clear all;
if isequal(exist('mypi','var'),0)
    mypi=raspi('192.168.1.21','pi','cardyna!');
end

fopen(s);
Length_Data=10000;
[Data.X,Data.Y,Data.Z]=deal(zeros(1,Length_Data));

% f=figure;
% hold on;
% h1=plot(NaN,NaN,'-b');
% ylim([0 4096])
%flush(s);
%flush(s);
h1=plot(NaN,NaN,'-+b');
flushoutput(s)
flushinput(s)
pause(0.1)
tic;
for i=1:Length_Data
%    tic;
    RetrieveData=fscanf(s);
    commas = strfind(RetrieveData,',');
    Data.X(i) = str2double(RetrieveData(commas(6):commas(7)-1));
    Data.Y(i) = str2double(RetrieveData(commas(7):commas(8)-1));
    Data.Z(i) = str2double(RetrieveData(commas(8):end-1));
    
    h1.XData=1:i;
    h1.YData=Data.X(1:i);
    
%    plot(1:i,Data.X(1:i),'-+r');
%     plot(1:i,Data.Y(1:i),'-+g');
%     plot(1:i,Data.Z(1:i),'-+b');
    drawnow;
 %   toc;
    
    %             data = fscanf(arduino);
    %             commas = strfind(data,',');
    %             array1(i) = str2num(data(1:commas(1)-1));
    %             array2(i) = str2num(data(commas(1):commas(2)-1));
    %             array3(i) = str2num(data(commas(2):commas(3)-1));
    %             array4(i) = str2num(data(commas(3):end));
   
end
% toc
% figure
% plot(Data.Time,Data.Tension,'-+r')
% figure
% pspectrum(Data.Tension,1000/(mean(diff(Data.Time)/1000)))