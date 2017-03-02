clear all;close all;clc;

%%This scripts loads all audio files in the  directory where the script is
%%located into a cell structure that contains the audios and a common Fs
%%for all of them
[audios_men,Fs_men, file_names_men] = load_data('audio_files_men');
[audios_women,Fs_women, file_names_women] = load_data('audio_files_women');
[audios_kids,Fs_kids, file_names_kids] = load_data('audio_files_kids');


vowels_men = get_letter_nucleous('times_men_ordered.txt', audios_men,Fs_men);
vowels_women = get_letter_nucleous('times_women_ordered.txt', audios_women,Fs_women);
vowels_kids = get_letter_nucleous('times_kids_ordered.txt', audios_kids,Fs_kids);

formants1 = compute_formants(vowels_kids{1}, Fs_kids);