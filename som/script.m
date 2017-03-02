clear all;close all;clc;

% db = 'database_process\vowels_men';
% db = 'database_process\vowels_women';
db = 'database_process\vowels_kids';

%% Create spectrograms from all audio files
create_spectrograms(db);

%% Organize spectrograms with SOM
epochs = 200;
output_nodes = 100;
neig_size = 5;
eta = 0.5;
tau = 10;

som(db, epochs, output_nodes, neig_size, eta, tau);
