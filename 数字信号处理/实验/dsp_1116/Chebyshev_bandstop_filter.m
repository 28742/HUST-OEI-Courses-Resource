function y=Chebyshev_bandstop_filter(x,fplowow,fphighigh,fplow,fphigh,rp,rs,Fs)
    %ʵ���б�ѩ������˲���
    %x:��Ҫ��ͨ�˲�������
    % fplowow�������߽�
    % fphighigh������ұ߽�
    % fplow��˥����ֹ��߽�
    % fphigh��˥���ֹ�ұ߽�
    %rp���ߴ���˥��DB������
    %rs����ֹ��˥��DB������
    %FS������x�Ĳ���Ƶ��
    
    wp1=2*pi*fplowow/Fs;
    wp3=2*pi*fphighigh/Fs;
    wsl=2*pi*fplow/Fs;
    wsh=2*pi*fphigh/Fs;
    wp=[wp1 wp3];
    ws=[wsl wsh];
    % ʹ��MATLAB�б�ѩ���˲���������
    [n,wn]=cheb1ord(ws/pi,wp/pi,rp,rs);
    [bz1,az1]=cheby1(n,rp,wp/pi,'stop');
    %�����˲����ķ�����Ӧ
    [h,w]=freqz(bz1,az1,256,Fs);
    h=20*log10(abs(h));
    figure;plot(w,h);
    ylabel('˥��/dB');xlabel('Ƶ��/Hz');title('�˲���������Ӧ');grid on;
    %�˲�
    y=filter(bz1,az1,x);
end




