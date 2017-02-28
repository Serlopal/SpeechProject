function [ data ] = generatedata( )
%generate a matrix with three columns, coordinates of with respect two the
%two formants in the first two plus a third column with its tag (1-a//2-e//3-i//4-o//5-u)
N=100; %% multiplo de 5
num_letters = 5;
samples = cell(1,num_letters);
data = cell(1,5);
data{1}=[];data{2}=[];data{3}=[];data{4}=[];data{5}=[];

bias = [0 1;1 0; 0 0; 1 1; 2 0];
for i=1:length(samples)
    for j=1:N/num_letters
        row = [rand()+bias(i,1) rand()+bias(i,2) i];
        data{i} = [data{i};row];      
    end  
end








end

