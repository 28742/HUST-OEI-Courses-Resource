
[audio_data,fs]=audioread('SunshineSquare.wav');
% Y = fft(y);
% % totalSamples = length(Y);
% Yp = abs(Y);
% % L = floor(fs/2)+1;
% % Yh = Y(1:L);
% % h = Yh/fs;
% % fz = fs/totalSamples;
% % k = 0:L-1;
% % f = fz*k;
% L = floor(fs/2)+1;
% plot(Yp);
f=fftshift(fft(audio_data));                  %b��ʾ�ź�ֵdata
w=linspace(-floor(fs)/2,floor(fs)/2,length(audio_data));  %�����ο�˹�ز�������512/2Ϊ���Ƶ��
figure1;
f1 = plot(w,abs(f));                      %HzΪ��λ

Fs=fs;
wp=[0.08*2*pi/Fs,0.2*2*pi/Fs];                %����ͨ�����ֽ�Ƶ��
ws=[0.10*2*pi/Fs,0.18*2*pi/Fs];  

Rp=1;                                   %����ͨ������ϵ��
Rs=20;                                  %�����������ϵ��     

[N,Wn]=buttord(wp,ws,Rp,Rs,'s');        %�������˹�˲�������N�ͽ�ֹƵ��Wn
fprintf('������˹�˲��� N= %4d\n',N);    %��ʾ�˲�������
[bb,ab]=butter(N,Wn,'s');               %�������˹�˲���ϵ���������亯���ķ��Ӻͷ�ĸ��ϵ������
b2=filter(bb,ab,audio_data);    


%�۲���Ӧ
W=-600:0.1:600;                             %����ģ��Ƶ��
[Hb,wb]=freqz(bb,ab,W,Fs);                  %�������˹�˲���Ƶ����Ӧ
f2 = plot(wb,20*log10(abs(Hb)),'b');             %��ͼ
xlabel('Hz');
ylabel('��ֵ/dB');

f1=fft(b2);                            %b2���˲����ź�
w1=linspace(-floor(fs)/2,floor(fs)/2,length(b2));  %�����ο�˹�ز�������512/2Ϊ���Ƶ��
f3 = plot(w1,abs(f1));
