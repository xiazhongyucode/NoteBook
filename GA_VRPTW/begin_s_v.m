%% �������������·���ϻ����Ը����˿Ϳ�ʼ�����ʱ��ͷ�����������ʱ��
%����VC��              ���ͷ���
%����a��               �˿���ʱ�䴰
%����s��               �ͻ���ķ���ʱ��
%����dist��            �������
%����v��               ������ʻ�ٶ�
%���bsv��             ����������·���ϻ����Ը����˿Ϳ�ʼ�����ʱ��ͷ�����������ʱ��
function bsv= begin_s_v(VC,a,s,dist,v)
n=size(VC,1);           %����ʹ����Ŀ
bsv=cell(n,1);
for i=1:n
    route=VC{i};
    %�������������·���ϻ����Ը����˿Ϳ�ʼ�����ʱ��ͷ�����������ʱ��
    [bs,back]=begin_s(route,a,s,dist,v);
    bsv{i}=[bs,back];
end
end