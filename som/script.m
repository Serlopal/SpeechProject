clear all;close all;clc;

db = 'database_process\vowels_men';
% db = 'database_process\vowels_women';
% db = 'database_process\vowels_kids';

%% Create spectrograms from all audio files
%create_spectrograms(db);

%% Organize spectrograms with SOM
epochs = 50;
samples = 540; %12 is a complete speaker
output_nodes = 6400;
neig_size = 5;
eta = 0.5;
tau = 20;

som(db, epochs, samples, output_nodes, neig_size, eta, tau);
