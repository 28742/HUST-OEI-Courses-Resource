%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  FileName:            FskSysTx.m
%  Description:         FSKͨ��ϵͳ�����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Parameter List:       
%       Output Parameter
%           SendBit     ��������Դ
%           SendSig     DPSK�ѵ��ź�
%           MsgLen      ����Դ����
%       Input Parameter
%           Fs          ������
%           Rs          ��Ԫ����
%           SFile       ����Դ�ļ�
%           SigLen      �����źų���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [SendBit,SendSig,MsgLen]  = FskSysTx(Fs, Rs, SFile, SigLen)
UpSampleRate=Fs/Rs;
CoderConstraint = 7;%  Լ������ 
Preamble=[1 1 1 1 0 1 0 1 1 0 0 1 0 0 0 0];

% generate message
load(SFile);  %������Դ����
MsgLen = length(SendBit);

%% �������������ʵ�����������
% convolutoinal coding
trel = poly2trellis(CoderConstraint, [171, 133]);
SendBitWithTail = [SendBit, zeros(size(1 : CoderConstraint - 1))];%  ��β����, ����Ϣ�Ľ�β��� coder_constraint-1 ����
code = convenc(SendBitWithTail, trel);%  ���ÿ⺯�������ɾ����

% add preamble 
data=[Preamble,code];

% FSK modulation



% ȷ���źų�����SigLen
if length(SendSig)>SigLen
    SendSig = SendSig(1:SigLen);
elseif length(SendSig)<SigLen
    SendSig = [SendSig zeros(1,SigLen-length(SendSig))];
end

