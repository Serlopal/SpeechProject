function [data, Fs] = load_data(db_path)
% This functions loads the audio data from the database

    cd(db_path);
    files = dir();
    data = cell(1,length(files));

    for i=1:length(files)
        if endsWith(files(i).name, '.wav')
            s = strcat(files(i).folder,'\',files(i).name);
            disp(s);
            [ys,Fs] = audioread(s);
            data{i} = ys; 
        end
    end
    
     data = data(~cellfun('isempty',data));



    cd ..
end

