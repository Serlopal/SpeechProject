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

ei_index_men = strmatch('ei',indexes);
ei_vowels = vowels(ei_index_men,:);

er_index_men = strmatch('er',indexes);
er_vowels = vowels(er_index_men,:);

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

% centroid_ae = [mean(ae_vowels, 1); std(ae_vowels, 0, 1)];
% centroid_ah = [mean(ah_vowels, 1); std(ah_vowels, 0, 1)];
% centroid_aw = [mean(aw_vowels, 1); std(aw_vowels, 0, 1)];
% centroid_eh = [mean(eh_vowels, 1); std(eh_vowels, 0, 1)];
% centroid_ei = [mean(ei_vowels, 1); std(ei_vowels, 0, 1)];
% centroid_er = [mean(er_vowels, 1); std(er_vowels, 0, 1)];
% centroid_ih = [mean(ih_vowels, 1); std(ih_vowels, 0, 1)];
% centroid_iy = [mean(iy_vowels, 1); std(ah_vowels, 0, 1)];

% plot(centroid_ae(1,1), centroid_ae(1,2), 'xb');
% hold on;
% plot_ellipse(centroid_ae(1,1), centroid_ae(1,2), centroid_ae(2,1), centroid_ae(2,2));
% hold on;
% plot(centroid_ah(1,1), centroid_ah(1,2), 'xr');
% hold on;
% plot_ellipse(centroid_ah(1,1), centroid_ah(1,2), centroid_ah(2,1), centroid_ah(2,2));
% hold on;
% plot(centroid_aw(1,1), centroid_aw(1,2), 'xg');
% hold on;
% plot_ellipse(centroid_aw(1,1), centroid_aw(1,2), centroid_aw(2,1), centroid_aw(2,2));
% hold on;
% plot(centroid_eh(1,1), centroid_eh(1,2), 'x');
% hold on;
% plot_ellipse(centroid_eh(1,1), centroid_eh(1,2), centroid_eh(2,1), centroid_eh(2,2));
% hold on;
% plot(centroid_ei(1,1), centroid_ei(1,2), 'xk');
% hold on;
% plot_ellipse(centroid_ei(1,1), centroid_ei(1,2), centroid_ei(2,1), centroid_ei(2,2));
% hold on;
% plot(centroid_er(1,1), centroid_er(1,2), 'xy');
% hold on;
% plot_ellipse(centroid_er(1,1), centroid_er(1,2), centroid_er(2,1), centroid_er(2,2));
% hold on;
% plot(centroid_ih(1,1), centroid_ih(1,2), 'xm');
% hold on;
% plot_ellipse(centroid_ih(1,1), centroid_ih(1,2), centroid_ih(2,1), centroid_ih(2,2));
% hold on;
% plot(centroid_iy(1,1), centroid_iy(1,2), 'xc');
% hold on;
% plot_ellipse(centroid_iy(1,1), centroid_iy(1,2), centroid_iy(2,1), centroid_iy(2,2));

% plot(ae_vowels(:,1),ae_vowels(:,2), 'ob' );
plot(ae_vowels(:,1),ae_vowels(:,2),'LineStyle','none','Color',[0 0 1],'Marker','o');
hold on;
plot(ah_vowels(:,1),ah_vowels(:,2),'LineStyle','none','Color',[0 1 1],'Marker','o');
hold on;
plot(aw_vowels(:,1),aw_vowels(:,2),'LineStyle','none','Color',[1 0 1],'Marker','o');
hold on;
plot(eh_vowels(:,1),eh_vowels(:,2),'LineStyle','none','Color',[1 0 0],'Marker','o');
hold on;
plot(ei_vowels(:,1),ei_vowels(:,2),'LineStyle','none','Color',[0 1 0],'Marker','o');
hold on;
plot(er_vowels(:,1),er_vowels(:,2),'LineStyle','none','Color',[0.5 0 0.5],'Marker','o');
hold on;
plot(ih_vowels(:,1),ih_vowels(:,2),'LineStyle','none','Color',[1 1 0],'Marker','o');
hold on;
plot(iy_vowels(:,1),iy_vowels(:,2),'LineStyle','none','Color',[0.5 0.5 0],'Marker','o');
hold on;
plot(oa_vowels(:,1),oa_vowels(:,2),'LineStyle','none','Color',[1 0.5 0],'Marker','o');
hold on;
plot(oo_vowels(:,1),oo_vowels(:,2),'LineStyle','none','Color',[0.33 0.34 0.33],'Marker','o');
hold on;
plot(uh_vowels(:,1),uh_vowels(:,2),'LineStyle','none','Color',[0 0.5 0.5],'Marker','o');
hold on;
plot(uw_vowels(:,1),uw_vowels(:,2),'LineStyle','none','Color',[0.8 0 0.2],'Marker','o');
hold off;
set(gca, 'ydir','reverse')
set(gca, 'xdir','reverse')
xlabel('1st formant (Hz)')
ylabel('2nd formant (Hz)')
title('Vowel Formant Plot')
view([90 -90])
legend('ae(had)','ah(hod)','aw(hawed)','eh(head)','ey/ei(hayed)','er(heard)','ih(hid)','iy(heed)', 'oa(hoed)', 'oo(hood)', 'uh(hud)', 'uw(who''d)')

end

function [ ] = plot_ellipse(x0, y0, a, b)
% a = horizontal radius
% b = vertical radius
% x0,y0 ellipse centre coordinates
range = 1;
t=-pi:0.01:pi;
x=x0 + range*a*cos(t);
y=y0 + range*b*sin(t);
plot(x,y);

end

