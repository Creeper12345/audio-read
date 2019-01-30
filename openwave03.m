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
[PK,PV] = findpeaks(x(:,1),time,'Annotate','extents','MinPeakHeight',0.1,'MinPeakDistance',1/15); %ÿһ��������Ϊ������������
findpeaks(x(:,1),time,'Annotate','extents','MinPeakHeight',0.1,'MinPeakDistance',1/15); %ÿһ��������Ϊ������������

filedir1 = 'E:\MATLAB\dszwork\audio\'; %���ļ���Ŀ¼
filename1 = '001.wav';  %���ļ�������
fle1 = [filedir1 filename1];   %��fle�������ļ�
[x1,Fs1] = audioread(fle1); %���ļ������������
wlen1 = 200;inc1 = 80;win1 = hanning(wlen1); %�Ӵ�
Nn = length(x1) ; %ȡ��x�ĳ���
time1 = (0:Nn-1)/Fs1;%����ʱ��
y1 = enframe(x1,win1,inc1);%��֡
fn = size(y1,2);%֡��
frameTime1 = (((1:fn) -1) * inc1 + wlen1/2)/Fs1;%����ÿ֡��Ӧ��ʱ��
W21 = wlen1/2 + 1;
n21 = 1:W21;
freq1 = (n21 -1) * Fs1/wlen1;%���㸵��Ҷ�任֮���Ƶ�ʿ̶�
Y1 = fft(y1);%��ʱ����Ҷ�任


% z=x(:,1);
pks1 = findpeaks(x1(:,1));
% Fs = 1; %����Ƶ��
MinPeakProminence1 = max(x1)/4; %����Сͻ���������
threshold1 = 0; %��ֵ�����ڽ���Ƚ�����
MinPeakHeight1 = max(x1)/2; %��С��߶�����
MinPeakDistance1 = 1/Fs; %��С��������
min1 = MinPeakHeight1;
nPeaks1 = 1; %�����nPeaks����
sortstr1 = 'none'; %�������
Annotate1 = 'extents'; %�ḻ�����
%���ȼ����׼,halfprom:��ͻ����ȿ� halfheight:��߿�
WidthReference1 = 'halfprom';
[PK1,PV1] = findpeaks(x1(:,1),time,'Annotate1','extents','MinPeakHeight1',0.1,'MinPeakDistance1',1/15); %ÿһ��������Ϊ������������



mattime = cell(1,N1-1);
for i = 1 : (N1-1)            %��������ÿ��ֵ�ó���
         t = PK(i , 1); %���
         time2 = PV(1, i);%ÿһ�β����ʱ��
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
% fp=fopen(textname ,'w');%�����ɱ༭�ļ�
% fprintf(fp,'%d ',x);%fpΪ�ļ������ָ��Ҫд�����ݵ��ļ���ע�⣺%d���пո�
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

% for i = 1 : (N1-1)            %��������ÿ��ֵ�ó���
%         t = PK(i , 1); %���
%         time2 = PV(1, i);%ÿһ�β����ʱ��
%         tt = PK(i+1,1);
%         time2x = PV(1, i+1);
%         timex = 1;
%         
%         fwrite = (fp , )
%         if time2x - time2 > 1/10
%             timex = min(timex , time2x-time2);
%         end
%         if (t >tt-0.05) and (t < tt +0.05) %���װ����
%                 
%         end
%         l = t*50 + 50;
%         fwrite =  (fp , );
%         if (t >  mean(PK+0.15)) %��ǳ�����
%             enter = t ;
%             fprintf(fid1,'%d ',enter);%fpΪ�ļ������ָ��Ҫд�����ݵ��ļ���ע�⣺%d���пո�
%         end
% end
% disp(date)
% fclose(fp);%�ر��ļ���
