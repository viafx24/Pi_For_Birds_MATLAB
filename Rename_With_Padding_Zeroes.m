
dirData = dir('F:\Documents\MATLAB\Pi_Mangeoire\Images\*.jpg');         %# Get the selected file data
filenames = {dirData.name};     %# Create a cell array of file names

newfilenames = regexprep(filenames,'(\d+)','${sprintf(''%04s'',$1)}')

% for iFile = 1:numel(fileNames)  %# Loop over the file names
%   newName = sprintf('image%04d.jpg',iFile);  %# Make the new name
%   %movefile(fileNames{iFile},newName);        %# Rename the file
% end

for ii = 1:numel(filenames)
   % newfilenames{ii}
   % filenames{ii}
    movefile(newfilenames{ii},filenames{ii});
end