function som(db, epochs, samples, output_nodes, neig_size, eta, tau)
    % This function organize the spectrograms (previously created) from the
    % database passed as an argument

    grid_size = sqrt(output_nodes);
    colormap(hsv(12));
%     colormap([1 1 1; 0 0 1; 0 1 0; 0 1 1; 1 0 0; 1 0 1; 1 1 0]) % TODO: put more colors

    % Format input and tags
    [patterns, tags] = formatData(db, samples);
    [num_patt, num_feat] = size(patterns);

    %% Train 
    % Weight init
    W = rand(output_nodes, num_feat);

    [x, y] = meshgrid([1:grid_size], [1:grid_size]);
    xpos = reshape(x, 1, output_nodes);
    ypos = reshape(y, 1, output_nodes);

    % Epochs and sequential patterns
    for e = 1:epochs
        disp(e)
        for pat = 1:num_patt
            %Pick pattern
            p = patterns(pat,:);

            %Compute distance
            v_dist = euclidean_dist(p, W);
            [~,i] = min(v_dist);

            %Update weights
            row = xpos(i);
            col = ypos(i);
            W = update_2D_neighborhood(W, p, row, col, neig_size, eta);        
        end

        %Reduce neightborhood for next iteration
        neig_size = round(neig_size * exp(-e^2/tau));
    end
    
    
    %% Output 
    % Locate winning node for each MP
    pos = zeros(num_patt, 1); 
    for pat = 1:num_patt
        %Pick pattern
        p = patterns(pat,:);

        %Compute distance
        v_dist = euclidean_dist(p, W);
        [~,i] = min(v_dist);

        % Save winning node
        pos(pat) = i;
    end
    
    a = ones(1, output_nodes)*num_patt+1;
    a(pos) = 1:num_patt;
    
    p = [tags;'00'];
    aux = p(reshape(a,grid_size,grid_size));
    image(p(reshape(a,grid_size,grid_size))+1);
end


function [patterns, tags] = formatData(db, samples)
    type_db = strsplit(db,'\');
    type_db = type_db{length(type_db)};
    f = strcat(pwd, '\', type_db, '_spectrograms');
    cd(f);

    patterns = [];
    tags = [];    
    
    f = strcat(pwd, '\');
    files = dir(fullfile(f, '*.png'));    
    max = min(length(files), samples);
    
    for i = 1:max
        if strfind(files(i).name,'.png')
            img = imread(files(i).name);
            pat = img(:)'; %row
            
            patterns = [patterns; pat];
            tags = [tags; files(i).name(4:5)];
        end 
    end
    
    cd ..
end
