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
        [y,fs] = audioread(s);
        window = hamming(64);
        noverlap = 32;
        nfft = 128;  
        
        % Create spectrogram
        [S,F,T,P] = spectrogram(y,window,noverlap,nfft,fs,'yaxis');
        final = surf(T,F,10*log10(P),'edgecolor','none');
        axis tight;
        view(0,90);        
        set(gca,'clim',[-80 -30]);
        
        % Remove irrelevant information
        colormap(gray);
        set(gca,'position',[0 0 1 1],'units','normalized')
        axis off 
        
        token = strsplit(files(i).name,{'\','.'});
        name = token{length(token)-1}; % The last one is the .wav extention

        print(name,'-r6', '-dpng') % r5 = 29x22 (638) // r6 = 910
    end
end

cd ..