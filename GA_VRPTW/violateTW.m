%% ���㵱ǰ���ͷ��������й˿�Υ����ʱ�䴰Լ��֮��
%����VC��              ���ͷ���
%����a��               �˿���ʱ�䴰
%����b��               �˿���ʱ�䴰
%����s��               �ͻ���ķ���ʱ��
%����L��               ����������ʱ�䴰
%����dist��            �������
%����v��               ������ʻ�ٶ�
%���w��               ��ǰ���ͷ��������й˿�Υ����ʱ�䴰Լ��֮��
function w=violateTW(VC,a,b,s,L,dist,v)
NV=size(VC,1);                              %����ʹ����Ŀ
w=0;
bsv=begin_s_v(VC,a,s,dist,v);               %�������������·���ϻ����Ը����˿Ϳ�ʼ�����ʱ��ͷ�����������ʱ��
%% ֻ��������ʱ�䴰�������Υ��ʱ�䴰Լ��
for i=1:NV
    route=VC{i};
    bs=bsv{i};
    l_bs=length(bsv{i});
    for j=1:l_bs-1
        if bs(j)>b(route(j))
            w=w+bs(j)-b(route(j));
        end
    end
    if bs(end)>L
        w=w+bs(end)-L;
    end
end
end