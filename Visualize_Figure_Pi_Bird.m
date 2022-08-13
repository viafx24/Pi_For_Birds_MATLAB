close all force;
clear all force;

Folder='D:\MATLAB_DATA\Data_Pi_Mangeoire\Video_LD_Analyzed\';
Full_Folder_Figure=[Folder,'Diff*.fig'];
%Full_Folder_Figure=[Folder,'Sum*.fig'];

Full_Folder_Video=[Folder,'*.mp4'];

Listing_Figure=dir(Full_Folder_Figure);
Listing_Video=dir(Full_Folder_Video);
length(Listing_Figure)

for iteration = 194:length(Listing_Figure)
    Listing_Figure(iteration).name
    openfig([Folder, Listing_Figure(iteration).name]);
    set(gcf,'Position',[1681 67 1280 907]);
    m(iteration)=implay([Folder, Listing_Video(iteration).name]);
    m(iteration).Parent.WindowState= 'maximized' ;
    m(iteration).Parent.Position=[850 58 814 867];
    
    
    if iteration >= 2
        close(m(iteration-1))
    end
    
    pause;
    close(gcf);
end