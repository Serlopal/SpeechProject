function [ ] = plot_clusters( vowels, indexes )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

ae_index_men = strmatch('ae',indexes);
ae_vowels = vowels(ae_index_men,:);

ah_index_men = strmatch('ah',indexes);
ah_vowels = vowels(ah_index_men,:);

aw_index_men = strmatch('aw',indexes);
aw_vowels = vowels(aw_index_men,:);

eh_index_men = strmatch('eh',indexes);
eh_vowels = vowels(eh_index_men,:);

er_index_men = strmatch('er',indexes);
er_vowels = vowels(er_index_men,:);

ey_index_men = strmatch('ey',indexes);
ey_vowels = vowels(ey_index_men,:);

ih_index_men = strmatch('ih',indexes);
ih_vowels = vowels(ih_index_men,:);

iy_index_men = strmatch('iy',indexes);
iy_vowels = vowels(iy_index_men,:);

oa_index_men = strmatch('oa',indexes);
oa_vowels = vowels(oa_index_men,:);

oo_index_men = strmatch('oo',indexes);
oo_vowels = vowels(oo_index_men,:);

uh_index_men = strmatch('uh',indexes);
uh_vowels = vowels(uh_index_men,:);

uw_index_men = strmatch('uw',indexes);
uw_vowels = vowels(uw_index_men,:);

plot(ae_vowels(:,1),ae_vowels(:,2), 'ob' );
hold on;
plot(ah_vowels(:,1),ah_vowels(:,2), 'or' );
hold on;
plot(aw_vowels(:,1),aw_vowels(:,2), 'og' );
hold on;
plot(eh_vowels(:,1),eh_vowels(:,2), 'ow' );
hold on;
plot(er_vowels(:,1),er_vowels(:,2), 'oy' );
hold on;
plot(ey_vowels(:,1),ey_vowels(:,2), 'ok' );
hold on;
plot(ih_vowels(:,1),ih_vowels(:,2), 'om' );
hold on;
plot(iy_vowels(:,1),iy_vowels(:,2), 'oc' );
hold on;
plot(oa_vowels(:,1),oa_vowels(:,2), 'o')
hold on;
plot(oo_vowels(:,1),oo_vowels(:,2), 'o')
hold on;
plot(uh_vowels(:,1),uh_vowels(:,2), 'o')
hold on;
plot(uw_vowels(:,1),uw_vowels(:,2), 'o')
hold off;

end

