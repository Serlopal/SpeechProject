clear all;close all;clc;

%%This scripts loads all audio files in the  directory where the script is
%%located into a cell structure that contains the audios and a common Fs
%%for all of them
[data,Fs] = load_data();