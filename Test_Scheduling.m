clear all;
mypi=raspi('192.168.1.21','pi','cardyna!');

Number_Download=0;
while Number_Download < 60 
    t1 = datetime('now');
    m = minute(t1);
    if mod(m,10)==0
        
        tic
        disp("Downloading... Wait...")
        getFile(mypi,'/home/pi/Documents/Pictures/USB_Cam_Mangeoire/*.jpg','F:\Documents\MATLAB\Pi_Mangeoire\Images')
        deleteFile(mypi,'/home/pi/Documents/Pictures/USB_Cam_Mangeoire/*.jpg')
        toc
        Number_Download=Number_Download+1
    end
    
end


%getFile(mypi,'/home/pi/Documents/Python/Pi_Mangeoire_Python/Data_Ina219.txt','F:\Documents\MATLAB\Pi_Mangeoire')



