function [ data,Fs, file_names ] = load_data(db_name)
%this functions loads the audio data from the database

    
    %%%%%%%%%%%%%%%%%%%%%%%%%%
    dirinfo = dir();
    dirinfo(~[dirinfo.isdir]) = []; 
    parent_dir = ismember( {dirinfo.name}, {'.', '..'});
    dirinfo(parent_dir) = [];
    
    db_dir = ismember( {dirinfo.name}, {db_name});
    dirinfo(~db_dir) = [];

    thisdir = dirinfo.name;
    files = dir(fullfile(thisdir, '*.wav'));
    %%%%%%%%%%%%%%%%%%%%%%%%%%
    data = cell(1,length(files));
    file_names = cell(1,length(files));

    for i=1:length(files)
        if strfind(files(i).name,'.wav')
            s = strcat(files(i).folder,'\',files(i).name);
%             disp(s);
            [ys,Fs] = audioread(s);
            data{i} = ys; 
            file_names{i} = s;
        end
    end
    
     data = data(~cellfun('isempty',data));
     file_names = file_names(~cellfun('isempty',file_names));




end

