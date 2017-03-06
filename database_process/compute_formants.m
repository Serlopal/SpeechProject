function [ formants ] = compute_formants( audio, Fs, poly_order )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

x1 = audio.*hamming(length(audio));

preemph = [1 0.63];
x1 = filter(1,preemph,x1);

A = lpc(x1,poly_order);

% for men, optimal value is 15 (13 also good)
% for women, optimal value is 13
% for kida, optimal value is 12
% CHECK AGAINST REAL VALUES TO FIND BEST VALUE


% x_values = linspace(-0.5,0.5,10000);
% plot(polyval(A,x_values), x_values);

rts = roots(A);


rts = rts(imag(rts)>=0);
angz = atan2(imag(rts),real(rts));

[frqs,indices] = sort(angz.*(Fs/(2*pi)));
bw = -1/2*(Fs/(2*pi))*log(abs(rts(indices)));

nn = 1;
for kk = 1:length(frqs)
    if (frqs(kk) > 90 && bw(kk) <400)
        formants(nn) = frqs(kk);
        nn = nn+1;
    end
end

if length(formants) < 2
    disp('short');
end

if length(formants) > 2
    formants = formants(1:2);
end

end

