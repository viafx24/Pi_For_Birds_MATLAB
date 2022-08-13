% clear all
% mypi=raspi('192.168.1.21','pi','cardyna!');


getFile(mypi,'/home/pi/Documents/Python/Pi_Mangeoire_Python/Data_Ina219.txt','F:\Documents\MATLAB\Pi_Mangeoire')
Data=readtable('Data_Ina219.txt');
Number_Of_Picture=Data.Var3(end)
Number_Of_Last_Picture=Data.Var4(end)

tic

for iteration=1:Number_Of_Picture

Filename = ['/home/pi/Documents/Pictures/USB_Cam_Mangeoire/picture_'  num2str(Number_Of_Last_Picture-Number_Of_Picture+iteration) '.jpg'] ;    
getFile(mypi,Filename,'F:\Documents\MATLAB\Pi_Mangeoire\Images');
deleteFile(mypi,Filename) 
disp([Filename ' Downloaded and Deleted']);

end

toc
