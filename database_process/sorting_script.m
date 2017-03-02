clear all;close all;clc;

fid = fopen('Times_kids.txt');
aux = {};
tline = fgets(fid);
idx = 1;

while ischar(tline)
    strs = strsplit(tline);

    aux = [aux strs{1}];
    
    tline = fgets(fid);
    idx = idx + 1;
end
[~,index] = sort(aux);
fclose(fid);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fid = fopen('Times_kids.txt');
aux = {};
tline = fgets(fid);
idx = 1;

while ischar(tline)

    aux = [aux tline];
    tline = fgets(fid);
    idx = idx + 1;
end
%%put lines in correct order
aux = aux(index);
fclose(fid);
%% writes lines to file
fid = fopen('times_kids_ordered.txt','w');
for i=1:length(aux)
    fprintf(fid,aux{i});
end
fclose(fid);
