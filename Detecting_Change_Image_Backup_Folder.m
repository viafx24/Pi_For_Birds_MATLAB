close all;
clear all;

Dir_Video_LD=dir('D:\MATLAB_DATA\Data_Pi_Mangeoire\Video_LD_Backup\');
Dir_Video_LD=Dir_Video_LD(~ismember({Dir_Video_LD.name},{'.','..'}));


tic
for iteration_2=1:length(Dir_Video_LD)
%for iteration_2=1:20
    
    Dir_Video_LD(iteration_2).name
    Name_Video=['D:\MATLAB_DATA\Data_Pi_Mangeoire\Video_LD_Backup\', Dir_Video_LD(iteration_2).name];
    
    v = VideoReader(Name_Video);
    Sum_Images=zeros([1 v.NumFrames ]);
    Sum_Images_Only = zeros([1 v.NumFrames ]);
    
    iteration=1;
    Frame_1=rgb2gray(read(v,iteration));
    iteration=2;
    
    while iteration<v.NumFrames
        
        Frame_2=rgb2gray(read(v,iteration));
        Substract_Two_Images=Frame_2 -  Frame_1;
        Sum_Images(iteration)= sum(sum(Substract_Two_Images));
        Sum_Images_Only(iteration)=sum(sum(Frame_2));
        Frame_2 = Frame_1;
        iteration=iteration + 1;
        
    end
    
    figure
    plot(1:length(Sum_Images),Sum_Images,'-+b')
    Name_Fig1=['Diff_' Dir_Video_LD(iteration_2).name(1:end-4), '.fig'];
    savefig(['D:\MATLAB_DATA\Data_Pi_Mangeoire\Video_LD_Backup_Analyzed\', Name_Fig1] )
    close(gcf);
    figure
    plot(1:length(Sum_Images),Sum_Images_Only,'-+r')
    Name_Fig2=['Sum_' Dir_Video_LD(iteration_2).name(1:end-4), '.fig'];
    savefig(['D:\MATLAB_DATA\Data_Pi_Mangeoire\Video_LD_Backup_Analyzed\', Name_Fig2] )
    close(gcf);
    
    Name_File_Place_1=['D:\MATLAB_DATA\Data_Pi_Mangeoire\Video_LD_Backup\',Dir_Video_LD(iteration_2).name];
    Name_File_Place_2=['D:\MATLAB_DATA\Data_Pi_Mangeoire\Video_LD_Backup_Analyzed\',Dir_Video_LD(iteration_2).name];
    movefile(Name_File_Place_1,Name_File_Place_2)
    
    toc
    disp("Entering pause for 5 seconds")
    pause(5)
    
end

toc