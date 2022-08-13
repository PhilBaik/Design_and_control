function [CosTHD,SinTHD,CosradfreqDomain,SinradfreqDomain,frequencyRange]= THD(flux_cos_rot,flux_sin_rot)

DATA=flux_sin_rot';
Fs = size(DATA,1); %sampling rate
[SinradfreqDomain,frequencyRange] = positiveFFT(DATA,Fs);
DATA=flux_cos_rot';
Fs = size(DATA,1); %sampling rate
[CosradfreqDomain,frequencyRange] = positiveFFT(DATA,Fs);
H=0;
for n=3:size(frequencyRange,2)
    H=abs(CosradfreqDomain(n))^2+H;
end
CosTHD=H^0.5/abs(CosradfreqDomain(2));
H=0;
for n=3:size(frequencyRange,2)
    H=abs(SinradfreqDomain(n))^2+H;
end
SinTHD=H^0.5/abs(SinradfreqDomain(2));

end