function [ data,Fs ] = load_data()
%this functions loads the audio data from the databse

    files = dir();
    data = cell(1,length(files));

    for i=1:length(files)
        if startsWith(files(i).name,'m')
            s = strcat(files(i).folder,'\',files(i).name);
            disp(s);
            [ys,Fs] = audioread(s);
            data{i} = ys; 
        end
    end
    
     data = data(~cellfun('isempty',data));




end

