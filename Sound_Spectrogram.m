% clear all;
close all;

% figure
 %[y,Fs] = audioread('\\BOX\CleMichel\USB_Cam_Mangeoire\Test\video_Chaque_Seconde_15000_LD.mp4');
[y,Fs] = audioread('D:\MATLAB_DATA\Data_Pi_Mangeoire\Video_HD\HD_22-juil-2022_19-52-23.mp4');

%pspectrum(y(:,1),Fs,'spectrogram','TimeResolution', 1,'FrequencyLimits',[1000 50000])
%pspectrum(y(1:length(y)/8,1),Fs,'spectrogram','TimeResolution', 0.01,'FrequencyLimits',[1000 5000])

pspectrum(y,Fs,'spectrogram','TimeResolution', 0.1,'FrequencyLimits',[200 10000])
% figure
% [y,Fs] = audioread('\\BOX\CleMichel\USB_Cam_Mangeoire\Backup_For_Sound\video_1600_1M_10FPS_45sec.mp4');
% pspeczzzzzzzzzzzzzzzzzzztrum(y(:,1),Fs,'spectrogram')

% y(288*length(y)/600:291*length(y)/600,1)