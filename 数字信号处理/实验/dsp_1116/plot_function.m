function plot_function(y,fs,style)
    %style = 1ʱ��Ƶ��ͼ��style = 2 ʱ��ʱ��ͼ
    nfft= 2^nextpow2(length(y));%�ҳ�����y�ĸ���������2��ָ��ֵ���Զ��������FFT����nfft��
    y_ft=fft(y,nfft);%��y�źŽ���FFT���õ�Ƶ�ʵķ�ֵ�ֲ�
    y_f=fs*(0:nfft/2-1)/nfft;%�任���Ӧ��Ƶ�ʵ�����
    if style==1        
       plot(y_f,2*abs(y_ft(1:nfft/2))/length(y));
       ylabel('��ֵ');xlabel('Ƶ��/Hz');title('�ź�Ƶ����');
    elseif style==2
        n=1:length(y);
        plot(n/fs,y);
        ylabel('��ֵ');xlabel('ʱ��/s');title('�ź�ʱ����');
    end
end