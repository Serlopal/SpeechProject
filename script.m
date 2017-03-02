% clear all;close all;clc;
db = 'EnglishDB';
path = strcat(pwd, '\', db);

%% This scripts loads all audio files in the directory specified above into 
% a cell structure that contains the audios and a common Fs for all of them
% [data,Fs,file_names] = load_data(db);

%% Create spectrograms from all audio files
% create_spectrograms(db, data, Fs, file_names);

%% Organize spectrograms with SOM
epochs = 200;
output_nodes = 100;
neig_size = 5;
eta = 0.5;
tau = 10;

som(db, epochs, output_nodes, neig_size, eta, tau);
