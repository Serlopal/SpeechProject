function [dict, vowels_formants, indexes] = formants(s_audios, s_times)

%This scripts loads all audio files in the  directory where the script is
%located into a cell structure that contains the audios and a common Fs
%for all of them
% [audios_men,Fs_men, file_names_men] = load_data('audio_files_men');
[audios, Fs, file_names] = load_data(s_audios);

% vowels_men = get_letter_nucleous('times_men_ordered.txt', audios_men,Fs_men);
vowels = get_letter_nucleous(s_times, audios,Fs);

% save_audio_vowels(s_times, vowels_men, Fs_men, 'vowels_men');

vowels_formants = zeros(length(vowels),2);
indexes = cell(length(vowels),1);
dict = containers.Map;

for i=1:length(vowels)
    vowels_formants(i,:) = compute_formants(vowels{i}, Fs, 13);
    key = strcat(num2str(vowels_formants(i,1)),num2str(vowels_formants(i,2)));
    dict(key) = i;
    indexes{i} = get_label(file_names{i});
end

%%plotting
% plot_clusters(vowels_men_formants, indexes_men);