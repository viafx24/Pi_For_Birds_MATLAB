Dir_Video=dir('\\BOX\CleMichel\USB_Cam_Mangeoire\Video\');
Dir_Video=Dir_Video(~ismember({Dir_Video.name},{'.','..'}));
A=1;
Name=[Dir_Video(1).date  '.mat']
%New_Name = strrep(Name,'.','')
New_Name = strrep(Name,' ','_')
New_Name = strrep(New_Name,':','-')
%Name=['1' '.mat']

save(Name,'A')
