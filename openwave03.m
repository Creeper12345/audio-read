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
[PK,PV] = findpeaks(x(:,1),time,'Annotate','extents','MinPeakHeight',0.1,'MinPeakDistance',1/15); %每一个标记项后为其所跟的数字
findpeaks(x(:,1),time,'Annotate','extents','MinPeakHeight',0.1,'MinPeakDistance',1/15); %每一个标记项后为其所跟的数字

filedir1 = 'E:\MATLAB\dszwork\audio\'; %打开文件的目录
filename1 = '001.wav';  %打开文件的名称
fle1 = [filedir1 filename1];   %用fle来代替文件
[x1,Fs1] = audioread(fle1); %将文件变成两个矩阵
wlen1 = 200;inc1 = 80;win1 = hanning(wlen1); %加窗
Nn = length(x1) ; %取出x的长度
time1 = (0:Nn-1)/Fs1;%计算时间
y1 = enframe(x1,win1,inc1);%分帧
fn = size(y1,2);%帧数
frameTime1 = (((1:fn) -1) * inc1 + wlen1/2)/Fs1;%计算每帧对应的时间
W21 = wlen1/2 + 1;
n21 = 1:W21;
freq1 = (n21 -1) * Fs1/wlen1;%计算傅里叶变换之后的频率刻度
Y1 = fft(y1);%短时傅里叶变换


% z=x(:,1);
pks1 = findpeaks(x1(:,1));
% Fs = 1; %采样频率
MinPeakProminence1 = max(x1)/4; %峰最小突起幅度门限
threshold1 = 0; %峰值点与邻近点比较门限
MinPeakHeight1 = max(x1)/2; %最小峰高度门限
MinPeakDistance1 = 1/Fs; %最小峰间距门限
min1 = MinPeakHeight1;
nPeaks1 = 1; %最多找nPeaks个峰
sortstr1 = 'none'; %结果排序
Annotate1 = 'extents'; %丰富的输出
%峰宽度计算标准,halfprom:半突起幅度宽； halfheight:半高宽
WidthReference1 = 'halfprom';
[PK1,PV1] = findpeaks(x1(:,1),time,'Annotate1','extents','MinPeakHeight1',0.1,'MinPeakDistance1',1/15); %每一个标记项后为其所跟的数字



mattime = cell(1,N1-1);
for i = 1 : (N1-1)            %将矩阵中每个值拿出来
         t = PK(i , 1); %震幅
         time2 = PV(1, i);%每一次波峰的时间
         t2 = PK(i+1,1);
         time2x = PV(1, i+1);
         timex = 1;
         timetime = time2x - time2;
         mattime{1 , i} = timetime;
         disp(mattime);
end

% N1 = length(PK);
% disp(max(PK))
% mydate = datestr(now, 'yyyymmddHHMM');
% textname = ['E:\MATLAB\dszwork\txt\workfiles\' , mydate , '.txt'];
% fp=fopen(textname ,'w');%创建可编辑文件
% fprintf(fp,'%d ',x);%fp为文件句柄，指定要写入数据的文件。注意：%d后有空格。
% 
% fopen(fid2,'rt+');
% midifile = fid2;
% sub = '48546864000000060001000300784D54726B'; 
% len = strlength(x);
% i=1;
% while i<len
%     z = x(i:i+1);
%     d = hex2dec(z);
%     fwrite(fp,d);
%     i = i+2;
% end

% for i = 1 : (N1-1)            %将矩阵中每个值拿出来
%         t = PK(i , 1); %震幅
%         time2 = PV(1, i);%每一次波峰的时间
%         tt = PK(i+1,1);
%         time2x = PV(1, i+1);
%         timex = 1;
%         
%         fwrite = (fp , )
%         if time2x - time2 > 1/10
%             timex = min(timex , time2x-time2);
%         end
%         if (t >tt-0.05) and (t < tt +0.05) %标出装饰音
%                 
%         end
%         l = t*50 + 50;
%         fwrite =  (fp , );
%         if (t >  mean(PK+0.15)) %标记出重音
%             enter = t ;
%             fprintf(fid1,'%d ',enter);%fp为文件句柄，指定要写入数据的文件。注意：%d后有空格。
%         end
% end
% disp(date)
% fclose(fp);%关闭文件。
