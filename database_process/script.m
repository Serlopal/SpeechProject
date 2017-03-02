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


vowels_men_formants = zeros(length(vowels_men),2);
vowels_women_formants = zeros(length(vowels_women),2);
vowels_kids_formants = zeros(length(vowels_kids),2);

for i=1:length(vowels_men)
    vowels_men_formants(i,:) = compute_formants(vowels_men{i},Fs_men);
end
for i=1:length(vowels_women)
    vowels_women_formants(i,:) = compute_formants(vowels_women{i},Fs_women);
end
for i=1:length(vowels_kids)
    vowels_kids_formants(i,:) = compute_formants(vowels_kids{i},Fs_kids);
end


%%plotting


plot(vowels_men_formants(:,1),vowels_men_formants(:,2), 'ob' );













