function v_dist = euclidean_dist(input, w_matrix)

[output_nodes, ~] = size(w_matrix);

dif = ones(output_nodes, 1)* double(input) - w_matrix;
v_dist = sum(dif.^2, 2); %sum each row