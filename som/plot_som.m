function [ ] = plot_som(img)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
scale = [0 0 0; 0 0 1; 0 1 1; 1 0 1; 1 0 0; 0 1 0; 0.5 0 0.5; 1 1 0; 0.5 0.5 0 ; 1 0.5 0 ; 0.33 0.34 0.33 ; 0 0.5 0.5; 0.8 0 0.2];
colormap(scale);

image(img)
title('Vowel spectrograms SOM plot')
L = line(ones(13),ones(13), 'LineWidth',8);
set(L,{'color'},mat2cell(scale,ones(1,13),3))
legend('background','ae(had)','ah(hod)','aw(hawed)','eh(head)','ey/ei(hayed)','er(heard)','ih(hid)','iy(heed)','oa(hoed)','oo(hood)','uh(hud)','uw(who''d)', 'Location', 'northeastoutside') 



end

