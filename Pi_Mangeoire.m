%mypi2=raspi('192.168.1.21','pi','raspberry');
%mypi2=raspi('192.168.1.21','pi','cardyna!');
%system(mypi2,'gpio mode 15 ALT0');
%system(mypi2,'gpio mode 16 ALT0');
%global myserialdevice ;
%myserialdevice = serialdev(mypi2,'/dev/ttyAMA0',9600);

clear all
 mypi2=raspi('192.168.1.21','pi','cardyna!');
 global wcam ;
 wcam = webcam(mypi2,'HD Webcam C525 (usb-3f980000.usb-1.4)','1920x1080');
 %wcam = webcam(mypi2,'HD Webcam C525 (usb-3f980000.usb-1.4)','320x240');
 %wcam = webcam(mypi2,'HD Webcam C525 (usb-3f980000.usb-1.4)','640x480');
 
 %wcam = webcam(mypi2,'HD Webcam C525 (usb-3f980000.usb-1.2):','1920x1080');
%wcam = webcam(mypi2,'HD Webcam C525 (usb-3f980000.usb-1.3):','320x240');

iteration=4;
while iteration==4
tic
img = snapshot(wcam);
toc
%pause(1);
% Name=['F:\Documents\MATLAB\Pi_Mangeoire\Images\image_' num2str(i) '.jpeg'];
% imwrite(img,Name,'Quality',100);
imshow(img);
toc
end



% iteration=4;
% for i=1:iteration
% tic
% img = snapshot(wcam);
% toc
% %pause(1);
% Name=['F:\Documents\MATLAB\Pi_Mangeoire\Images\image_' num2str(i) '.jpeg'];
% imwrite(img,Name,'Quality',100);
% imshow(img);
% end

% for i=1:iteration
%     Name=['F:\Documents\MATLAB\Pi_Mangeoire\Images\image_' num2str(i) '.jpeg'];
%     img=imread(Name);
%     imshow(img);
%     pause(0.388);
% end