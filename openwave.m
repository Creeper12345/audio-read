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
xlabel('ʱ��/s');ylabel('��ֵ');
title('�����źŲ���');
subplot(2,1,2); 

% z=x(:,1);
pks = findpeaks(x(:,1));
% Fs = 1; %����Ƶ��
MinPeakProminence = max(x)/4; %����Сͻ���������
threshold = 0; %��ֵ�����ڽ���Ƚ�����
MinPeakHeight = max(x)/5; %��С��߶�����
MinPeakDistance = 600/Fs; %��С��������
nPeaks = 6; %�����nPeaks����
sortstr = 'none'; %�������
Annotate = 'extents'; %�ḻ�����
%���ȼ����׼,halfprom:��ͻ����ȿ� halfheight:��߿�
WidthReference = 'halfprom';
%[PK,PV]=findpeaks(x(:,1),time,'Annotate','extents','MinPeakHeight',0.3);
findpeaks(x(:,1),time,'Annotate','extents','MinPeakHeight',0.3);
% findpeaks(x,Fs,'MinPeakProminence',MinPeakProminence, ...
% 'threshold',threshold,'MinPeakHeight',MinPeakHeight, ...
% 'MinPeakDistance',MinPeakDistance,'npeaks',nPeaks, ...
% 'sortstr',sortstr, ...
% 'Annotate',Annotate,'WidthReference',WidthReference); 
 