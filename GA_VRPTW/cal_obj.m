%% ������Ⱥ��Ŀ�꺯��ֵ
%����Chrom��           ��Ⱥ
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
%���Obj��             ÿ�������Ŀ�꺯��ֵ�����ø����������ͷ������ܳɱ�
function Obj=cal_obj(Chrom,cusnum,cap,demands,a,b,L,s,dist,alpha,belta,v)
NIND=size(Chrom,1);                         %��Ⱥ��Ŀ
Obj=zeros(NIND,1);                          %����ÿ�������Ŀ�꺯��ֵ
for i=1:NIND
    %����i�������������ͷ���
    VC=decode(Chrom(i,:),cusnum,cap,demands,a,b,L,s,dist,v);
    %�������������ͷ������ܳɱ�
    costF=cost_fuction(VC,a,b,s,L,dist,demands,cap,alpha,belta,v);
    Obj(i)=costF;
end
end