clear all;close all;clc;

db = 'database_process\vowels_men';
% db = 'database_process\vowels_women';
% db = 'database_process\vowels_kids';

%% Create spectrograms from all audio files
create_spectrograms(db);

%% Organize spectrograms with SOM
epochs = 500;
samples = 12; %12 is a complete speaker
output_nodes = 25;
neig_size = 5;
eta = 0.2;
tau = 10;

som(db, epochs, samples, output_nodes, neig_size, eta, tau);
