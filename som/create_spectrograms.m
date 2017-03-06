function create_spectrograms(db)
% This function creates images of the spectrograms for all audio files in
% the database. The name is the same as the original audio file

type_db = strsplit(db,'\');
type_db = type_db{length(type_db)};

cd ..
complete_path = strcat(pwd, '\', db);
files = dir(fullfile(complete_path, '*.wav'));
cd(strcat(pwd, '\som'))


% Create folder if it does not exist
f = strcat(pwd, '\', type_db, '_spectrograms');
if ~exist(f, 'dir')
    mkdir(f);
end

cd(f);


% For each file in the dir, create spectrogram
for i=1:length(files)
    if strfind(files(i).name,'.wav')
        
        % Get file
        s = strcat(files(i).folder,'\',files(i).name);
        [ys,~] = audioread(s);
        
        % Save spectrogram
        spectrogram(ys);
        set(gca,'position',[0 0 1 1],'units','normalized')
        axis off 
%         im = rgb2gray(im);
%         colormap(1-gray);
        colormap(gray)
        
        token = strsplit(files(i).name,{'\','.'});
        name = token{length(token)-1}; % The last one is the .wav extention

        print(name,'-r5', '-dpng') % r5 = 71x34 (2414)
    end
end

cd ..