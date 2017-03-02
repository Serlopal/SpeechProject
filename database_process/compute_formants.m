function [ formants ] = compute_formants( audio, Fs )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

x1 = audio.*hamming(length(audio));

preemph = [1 0.63];
x1 = filter(1,preemph,x1);

A = lpc(x1,10);
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

end

