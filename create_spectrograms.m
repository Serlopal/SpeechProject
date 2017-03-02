function create_spectrograms(db, data, file_names)
% This function creates images of the spectrograms for all audio files in
% the database. The name is the same as the original audio file


% Create folder if it does not exist
f = strcat(pwd, '\', db, '_spectrograms');
if ~exist(f, 'dir')
    mkdir(f);
end

cd(f);

% Save spectrogram images
for i = 1:length(data)
    spectrogram(data{i});
    set(gca,'position',[0 0 1 1],'units','normalized')
    axis off 
    colormap(1-gray);  
    
    name = file_names{i};
    token = strsplit(name,{'\','.'});
    name = token{length(token)-1}; % The last one is the .wav extention
    
    print(name,'-r5', '-dpng') % r5 = 71x34 (2414)
end

cd ..