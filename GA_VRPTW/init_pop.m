%% ��ʼ����Ⱥ
%����NIND��                ��Ⱥ��Ŀ
%����N��                   Ⱦɫ�峤��
%����cusnum��              �˿���Ŀ
%����init_vc��             ��ʼ���ͷ���
%���Chrom��               ��ʼ��Ⱥ
function Chrom=init_pop(NIND,N,cusnum,init_vc)
Chrom=zeros(NIND,N);%���ڴ洢��Ⱥ
individual=change(init_vc,N,cusnum);
for j=1:NIND
    Chrom(j,:)=individual;
end