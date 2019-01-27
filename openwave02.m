filedir = 'E:\MATLAB\dszwork\audio\'; %���ļ���Ŀ¼
filename = 'snaredrum.wav';  %���ļ�������
fle = [filedir filename];   %��fle�������ļ�
% whos fle;       %�г�������Ϣ
[x,Fs] = audioread(fle); %���ļ������������
wlen = 200;inc = 80;win = hanning(wlen); %�Ӵ�
N = length(x) ; %ȡ��x�ĳ���
time = (0:N-1)/Fs;%����ʱ��
y = enframe(x,win,inc);%��֡
fn = size(y,2);%֡��
frameTime = (((1:fn) -1) * inc + wlen/2)/Fs;%����ÿ֡��Ӧ��ʱ��
W2 = wlen/2 + 1;
n2 = 1:W2;
freq = (n2 -1) * Fs/wlen;%���㸵��Ҷ�任֮���Ƶ�ʿ̶�
Y = fft(y);%��ʱ����Ҷ�任
clf%��ʼ��ͼ��
set(gcf, 'Position', [20 100 600 500]);
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
MinPeakHeight = max(x)/2; %��С��߶�����
MinPeakDistance = 1/Fs; %��С��������
min = MinPeakHeight;
nPeaks = 1; %�����nPeaks����
sortstr = 'none'; %�������
Annotate = 'extents'; %�ḻ�����
%���ȼ����׼,halfprom:��ͻ����ȿ� halfheight:��߿�
WidthReference = 'halfprom';
%[PK,PV]=findpeaks(x(:,1),time,'Annotate','extents','MinPeakHeight',0.3);

[PK,PV] = findpeaks(x(:,1),time,'Annotate','extents','MinPeakHeight',0.1,'MinPeakDistance',1/15); %ÿһ��������Ϊ������������
findpeaks(x(:,1),time,'Annotate','extents','MinPeakHeight',0.1,'MinPeakDistance',1/15); %ÿһ��������Ϊ������������
% findpeaks(x,Fs,'MinPeakProminence',MinPeakProminence, ...
% 'threshold',threshold,'MinPeakHeight',MinPeakHeight, ...
% 'MinPeakDistance',MinPeakDistance,'npeaks',nPeaks, ...
% 'sortstr',sortstr, ...
% 'Annotate',Annotate,'WidthReference',WidthReference); 

N1 = length(PK);
disp(max(PK))
scenes = dir(fullfile('E:\MATLAB\dszwork\txt'));
date = datestr(now, 'yyyy/mm/dd/HH:MM');
fid1=['date','.txt'];   %�����µ�txt�ļ�
fopen(fid1,'wt');   %��txt�ļ�
for i = 1 : N1
    t = PK(i , 1);
    time2 = PV(1, i);
    disp(t)
    disp(time2)
    if (t >  ) 
        enter = t ;
        fprintf(fid1,'%d ',enter);%fpΪ�ļ������ָ��Ҫд�����ݵ��ļ���ע�⣺%d���пո�
    end
end
disp(date)
