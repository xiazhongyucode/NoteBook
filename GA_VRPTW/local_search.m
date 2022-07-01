%% �ֲ���������
%����SelCh��           �����������Ӵ���Ⱥ
%����cusnum��          �˿���Ŀ
%����cap��             �������װ����
%����demands��         �˿�������
%����a��               �˿���ʱ�䴰
%����b��               �˿���ʱ�䴰
%����L��               ����������ʱ�䴰
%����s��               �ͻ���ķ���ʱ��
%����dist��            �������
%����alpha��           Υ��������Լ���ĳͷ�����ϵ��
%����belta��           Υ��ʱ�䴰Լ���ĳͷ�����ϵ��
%����v��               ������ʻ�ٶ�
%���SelCh��           �ֲ���������Ӵ���Ⱥ
function SelCh=local_search(SelCh,cusnum,cap,demands,a,b,L,s,dist,alpha,belta,v)
D=15;                               %�ƻ������е����Ԫ��
toRemove=min(ceil(cusnum/2),15);    %��Ҫ�Ƴ��Ĺ˿�����
[row,N]=size(SelCh);                
for i=1:row
    %% ����i���Ӵ������������ͷ���
    VC=decode(SelCh(i,:),cusnum,cap,demands,a,b,L,s,dist,v);
    %% �����������ͷ������ܳɱ�
    CF=cost_fuction(VC,a,b,s,L,dist,demands,cap,alpha,belta,v);
    %% �ƻ�����
    [removed,rfvc]=remove(cusnum,toRemove,D,dist,VC);
    %% �޸�����
    ReIfvc=re_inserting(removed,rfvc,cap,demands,a,b,L,s,dist,v);
    %����ͷ�����
    RCF=cost_fuction(ReIfvc,a,b,s,L,dist,demands,cap,alpha,belta,v);
    if RCF<CF
        chrom=change(ReIfvc,N,cusnum);
        SelCh(i,:)=chrom;
    end
end