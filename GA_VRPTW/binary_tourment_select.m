%% ��Ԫ������ѡ��
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
%���Selch��           ��Ԫ������ѡ������Ӵ���Ⱥ
function Selch=binary_tourment_select(Chrom,cusnum,cap,demands,a,b,L,s,dist,alpha,belta,v)
Obj=cal_obj(Chrom,cusnum,cap,demands,a,b,L,s,dist,alpha,belta,v);   %������ȺĿ�꺯��ֵ����ÿ��������ܳɱ�        
fit=fitness(Obj);                       %����ÿ���������Ӧ��ֵ
NIND=size(Chrom,1);                     %��Ⱥ��Ŀ
index=[];                               %���汻ѡ�еĸ�����
for i=1:NIND
    R=randperm(NIND);                   %����һ��1~NIND���������
    index1=R(1);                        %��һ���Ƚϵĸ������
    index2=R(2);                        %�ڶ����Ƚϵĸ������
    fit1=fit(index1,:);                 %��һ���Ƚϵĸ������Ӧ��ֵ����Ӧ��ֵԽ��˵����������Խ�ߣ�
    fit2=fit(index2,:);                 %�ڶ����Ƚϵĸ������Ӧ��ֵ
    %�������1����Ӧ��ֵ ���ڵ��� ����2����Ӧ��ֵ���򽫸���1��Ϊ��iѡ����ĸ���
    if fit1>=fit2
        index=[index;index1];
    else
        %�������1����Ӧ��ֵ С�� ����2����Ӧ��ֵ���򽫸���2��Ϊ��iѡ����ĸ���
        index=[index;index2];
    end
end
index=unique(index);
Selch=Chrom(index,:);
end