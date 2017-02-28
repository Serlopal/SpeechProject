% clear all;close all;clc;
db = 'EnglishDB';
path = strcat(pwd, '\', db);

%% This scripts loads all audio files in the directory specified above into 
% a cell structure that contains the audios and a common Fs for all of them
% [data,Fs,file_names] = load_data(db);

%% Create spectrograms from all audio files
create_spectrograms(db, data, Fs, file_names);
