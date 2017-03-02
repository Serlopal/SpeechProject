function w_matrix = update_2D_neighborhood(w_matrix, input, row, col, neig_size, eta)
% Manhattan distance

%Set neighborhood
[output_nodes,~] = size(w_matrix);
grid_size = sqrt(output_nodes);

left_lim = max(col - neig_size, 1);
right_lim = min(col + neig_size, grid_size);
upper_lim = max(row - neig_size, 1);
lower_lim = min(row + neig_size, grid_size);

%Update
for x_pos = left_lim:right_lim
    for y_pos = upper_lim:lower_lim
        
        x_dif = abs(x_pos - col);
        y_dif = abs(y_pos - row);
        if x_dif+y_dif <= neig_size
            i = grid_size * (y_pos-1) + x_pos;
            w_matrix(i,:) = w_matrix(i,:) + eta .* (double(input) - w_matrix(i,:));
        end
    
    end
end