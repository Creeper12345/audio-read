filedir = 'E:\MATLAB\dszwork\audio\';
filename = 'snaredrum.wav';
fle = [filedir filename];
whos fle;
[x,Fs] = audioread(fle);
wlen = 200;inc = 80;win = hanning(wlen);
N = length(x) ; 
time = (0:N-1)/Fs;
y = enframe(x,win,inc);
fn = size(y,2);
frameTime = (((1:fn) -1) * inc + wlen/2)/Fs;
W2 = wlen/2 + 1;
n2 = 1:W2;
freq = (n2 -1) * Fs/wlen;
Y = fft(y);
clf
axes('Position',[0.07 0.72 0.9 0.22]);
plot(time,x,'k');
xlim([0 max(time)]);
xlabel('时间/s');ylabel('幅值');
title('语音信号波形');
subplot(2,1,2); 

% z=x(:,1);
pks = findpeaks(x(:,1));
% Fs = 1; %采样频率
MinPeakProminence = max(x)/4; %峰最小突起幅度门限
threshold = 0; %峰值点与邻近点比较门限
MinPeakHeight = max(x)/5; %最小峰高度门限
MinPeakDistance = 600/Fs; %最小峰间距门限
nPeaks = 6; %最多找nPeaks个峰
sortstr = 'none'; %结果排序
Annotate = 'extents'; %丰富的输出
%峰宽度计算标准,halfprom:半突起幅度宽； halfheight:半高宽
WidthReference = 'halfprom';
%[PK,PV]=findpeaks(x(:,1),time,'Annotate','extents','MinPeakHeight',0.3);
findpeaks(x(:,1),time,'Annotate','extents','MinPeakHeight',0.3);
% findpeaks(x,Fs,'MinPeakProminence',MinPeakProminence, ...
% 'threshold',threshold,'MinPeakHeight',MinPeakHeight, ...
% 'MinPeakDistance',MinPeakDistance,'npeaks',nPeaks, ...
% 'sortstr',sortstr, ...
% 'Annotate',Annotate,'WidthReference',WidthReference); 
 