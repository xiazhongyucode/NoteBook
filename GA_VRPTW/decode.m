%% �������������ͷ���
%����individual��      ����
%����cusnum��          �˿���Ŀ
%����cap��             �������װ����
%����demands��         �˿�������
%����a��               �˿���ʱ�䴰
%����b��               �˿���ʱ�䴰
%����L��               ����������ʱ�䴰
%����s��               �ͻ���ķ���ʱ��
%����dist��            �������
%����v��               ������ʻ�ٶ�
%���VC��              ���ͷ���
%���NV��              ����ʹ����Ŀ
%���TD��              ������ʻ�ܾ���
%���violate_num��     Υ��Լ��·����Ŀ
%���violate_cus��     Υ��Լ���˿���Ŀ
function [VC,NV,TD,violate_num,violate_cus]=decode(individual,cusnum,cap,demands,a,b,L,s,dist,v)
violate_num=0;                                              %Υ��Լ��·����Ŀ
violate_cus=0;                                              %Υ��Լ���˿���Ŀ
VC=cell(cusnum,1);                                          %ÿ�����������Ĺ˿�
count=1;                                                    %��������������ʾ��ǰ����ʹ����Ŀ
location0=find(individual>cusnum);                          %�ҳ��������������ĵ�λ��
for i=1:length(location0)
    if i==1                                                 %��1���������ĵ�λ��
        route=individual(1:location0(i));                   %��ȡ������������֮���·��
        route(route==individual(location0(i)))=[];          %ɾ��·���������������
    else
        route=individual(location0(i-1):location0(i));      %��ȡ������������֮���·��
        route(route==individual(location0(i-1)))=[];        %ɾ��·���������������
        route(route==individual(location0(i)))=[];          %ɾ��·���������������
    end
    VC{count}=route;                                        %�������ͷ���
    count=count+1;                                          %����ʹ����Ŀ
end
route=individual(location0(end):end);                       %���һ��·��       
route(route==individual(location0(end)))=[];                %ɾ��·���������������
VC{count}=route;                                            %�������ͷ���
[VC,NV]=deal_VC(VC);                                        %��VC�пյ������Ƴ�
for j=1:NV
    route=VC{j};
    flag=judge_route(route,cap,demands,a,b,L,s,dist,v);     %�жϵ�ǰ�����Ƿ�����ʱ�䴰Լ����װ����Լ����0��ʾΥ��Լ����1��ʾ����ȫ��Լ��
    if flag==0
        violate_cus=violate_cus+length(route);              %�������·��������Լ������Υ��Լ���˿���Ŀ�Ӹ���·���˿���Ŀ
        violate_num=violate_num+1;                          %�������·��������Լ������Υ��Լ��·����Ŀ��1
    end
end
TD=travel_distance(VC,dist);                                %�÷���������ʻ�ܾ���
end