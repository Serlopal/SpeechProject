function [ cut_audios ] = get_letter_nucleous(times_file,audios,Fs)
% this function extracts the nucleous of the letters of interest
% from the raw audios
    
    cut_audios = cell(size(audios));
    fid = fopen(times_file);

    tline = fgets(fid);
    idx = 1;
    while ischar(tline)
        strs = strsplit(tline);
        %disp(idx);
        %disp(strs);
        begin = floor((Fs/1000)*str2double(strs{2}));
        finish = floor((Fs/1000)*str2double(strs{3}));
        
        cut_audios{idx} = audios{idx}(begin:finish);
        
        disp(tline)
        tline = fgets(fid);
        idx = idx + 1;
    end
    disp(idx);
    fclose(fid);


end

