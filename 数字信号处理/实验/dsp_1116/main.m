[audio_data,fs]=audioread('SunshineSquare.wav');
figure;plot_function(audio_data,fs,1);
figure;plot_function(audio_data,fs,2);
nfs = [1575,3150,4725];%�۲�õ�
band1 = 50;%���������ȣ��������Ƶ�ʵ�һ�룩
band2 = 200;%����ͨ����ȣ�ͬ�ϣ�
audio_data_new=audio_data;
%3���˲�
for i=1:3
    audio_data_new = Chebyshev_bandstop_filter(audio_data_new,nfs(i)-band1,nfs(i)+band1,nfs(i)-band2,nfs(i)+band2,0.1,30,fs);
    figure;plot_function(audio_data_new,fs,1);
end
figure;plot_function(audio_data_new,fs,2);
%ʱ�����ȥ��ֱ��
for i = 86080:length(audio_data_new)
    audio_data_new(i)=audio_data_new(i)-0.1295;    
end
figure;plot_function(audio_data_new,fs,2);
%ʱ����0��ȥ��ʣ������
audio_data_new(85270:86080) = 0;
audio_data_new(118500:119071) = 0;
figure;plot_function(audio_data_new,fs,1);
figure;plot_function(audio_data_new,fs,2);
%audiowrite('SunshineSquare_New.wav',audio_data_new,fs);
