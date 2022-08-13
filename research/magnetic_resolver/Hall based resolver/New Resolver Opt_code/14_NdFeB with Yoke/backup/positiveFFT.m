function [X,freq]=positiveFFT(x,Fs)
N=size(x,1); %get the number of points
k=0:N-1;     %create a vector from 0 to N-1
T=N/Fs;      %get the frequency interval
freq=k/T;    %create the frequency range
X=fft(x)/N*2; % normalize the data

%only want the first half of the FFT, since it is redundant
cutOff = ceil(N/2);

%take only the first half of the spectrum
if(size(X,1)>1)
    X = X(1:cutOff,:);
    X(1,:)=X(1,:)/2;
else
    X = X(1:cutOff);
    X(1) = X(1)/2;
end

% freq = freq(1:cutOff);
freq=Fs*(0:(N/2))/N; 