function create_spectrograms(db, data, Fs, file_names)
% This functions creates images of the spectrograms for all audio files in
% the database. The name is the same as the original audio file


% Create folder if it does not exist
f = strcat(pwd, '\', db, '_spectrograms');
if ~exist(f, 'dir')
    mkdir(f);
end

cd(f);

% Save spectrogram images
for i = 1:length(data)
    specgram(data{i},Fs);
    set(gca,'position',[0 0 1 1],'units','normalized')
    axis off 
    
    name = file_names{i};
    token = strsplit(name,{'\','.'});
    name = token{length(token)-1}; % The last one is the .wav extention
    
    print(name,'-dpng')
end

cd ..