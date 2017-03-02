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

save_audio_vowels('times_men_ordered.txt', vowels_men, Fs_men, 'vowels_men');
save_audio_vowels('times_women_ordered.txt', vowels_women, Fs_women, 'vowels_women');
save_audio_vowels('times_kids_ordered.txt', vowels_kids, Fs_kids, 'vowels_kids');



vowels_men_formants = zeros(length(vowels_men),2);
vowels_women_formants = zeros(length(vowels_women),2);
vowels_kids_formants = zeros(length(vowels_kids),2);

indexes_men = cell(length(vowels_men),1);
indexes_women = cell(length(vowels_women),1);
indexes_kids = cell(length(vowels_kids),1);

for i=1:length(vowels_men)
    vowels_men_formants(i,:) = compute_formants(vowels_men{i},Fs_men);
    indexes_men{i} = get_label(file_names_men{i});
end
for i=1:length(vowels_women)
    vowels_women_formants(i,:) = compute_formants(vowels_women{i},Fs_women);
    indexes_women{i} = get_label(file_names_women{i});
end
for i=1:length(vowels_kids)
    vowels_kids_formants(i,:) = compute_formants(vowels_kids{i},Fs_kids);
    indexes_kids{i} = get_label(file_names_kids{i});
end

%%plotting
plot_clusters(vowels_men_formants, indexes_men);
