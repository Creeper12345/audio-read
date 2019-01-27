filedir = 'E:\MATLAB\dszwork\audio\'; %打开文件的目录
filename = 'snaredrum.wav';  %打开文件的名称
fle = [filedir filename];   %用fle来代替文件
% whos fle;       %列出变量信息
[x,Fs] = audioread(fle); %将文件变成两个矩阵
wlen = 200;inc = 80;win = hanning(wlen); %加窗
N = length(x) ; %取出x的长度
time = (0:N-1)/Fs;%计算时间
y = enframe(x,win,inc);%分帧
fn = size(y,2);%帧数
frameTime = (((1:fn) -1) * inc + wlen/2)/Fs;%计算每帧对应的时间
W2 = wlen/2 + 1;
n2 = 1:W2;
freq = (n2 -1) * Fs/wlen;%计算傅里叶变换之后的频率刻度
Y = fft(y);%短时傅里叶变换
clf%初始化图形
set(gcf, 'Position', [20 100 600 500]);
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
MinPeakHeight = max(x)/2; %最小峰高度门限
MinPeakDistance = 1/Fs; %最小峰间距门限
min = MinPeakHeight;
nPeaks = 1; %最多找nPeaks个峰
sortstr = 'none'; %结果排序
Annotate = 'extents'; %丰富的输出
%峰宽度计算标准,halfprom:半突起幅度宽； halfheight:半高宽
WidthReference = 'halfprom';
%[PK,PV]=findpeaks(x(:,1),time,'Annotate','extents','MinPeakHeight',0.3);

[PK,PV] = findpeaks(x(:,1),time,'Annotate','extents','MinPeakHeight',0.1,'MinPeakDistance',1/15); %每一个标记项后为其所跟的数字
findpeaks(x(:,1),time,'Annotate','extents','MinPeakHeight',0.1,'MinPeakDistance',1/15); %每一个标记项后为其所跟的数字
% findpeaks(x,Fs,'MinPeakProminence',MinPeakProminence, ...
% 'threshold',threshold,'MinPeakHeight',MinPeakHeight, ...
% 'MinPeakDistance',MinPeakDistance,'npeaks',nPeaks, ...
% 'sortstr',sortstr, ...
% 'Annotate',Annotate,'WidthReference',WidthReference); 

N1 = length(PK);
disp(max(PK))
scenes = dir(fullfile('E:\MATLAB\dszwork\txt'));
date = datestr(now, 'yyyy/mm/dd/HH:MM');
fid1=['date','.txt'];   %创建新的txt文件
fopen(fid1,'wt');   %打开txt文件
for i = 1 : N1
    t = PK(i , 1);
    time2 = PV(1, i);
    disp(t)
    disp(time2)
    if (t >  ) 
        enter = t ;
        fprintf(fid1,'%d ',enter);%fp为文件句柄，指定要写入数据的文件。注意：%d后有空格。
    end
end
disp(date)
