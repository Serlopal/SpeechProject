clear all;close all;clc;
db = strcat(pwd, '\EnglishDB');

%% This scripts loads all audio files in the directory specified above into 
% a cell structure that contains the audios and a common Fs for all of them
[data,Fs] = load_data(db);