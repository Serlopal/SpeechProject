function [ cut_audios ] = save_audio_vowels(times_file,audios,Fs,folder_name)
% this function saves the audios of the extracted vowels
    
    cut_audios = cell(size(audios));
    fid = fopen(times_file);
    
    % Create folder if it does not exist
    f = strcat(pwd, '\', folder_name);
    if ~exist(f, 'dir')
        mkdir(f);
    end
    cd(f);

    % Save vowel audio
    tline = fgets(fid);
    idx = 1;
    while ischar(tline)
        strs = strsplit(tline);
        name = strcat(strs{1}, '.wav');
        audiowrite(name,audios{idx},Fs)
        
        tline = fgets(fid);
        idx = idx + 1;
    end
    
    fclose(fid);
    cd ..
end

