%% ����removed��ÿ���˿͵���С����ɱ�������Ӧ�Ĳ���·�߱�ź͸�·���ϵĲ���λ��
%����rv��              removed�����е���һ��Ԫ��
%���rfvc��            �ƻ�������ͷ���
%����cap��             �������װ����
%����demands��         �˿�������
%����a��               �˿���ʱ�䴰
%����b��               �˿���ʱ�䴰
%����L��               ����������ʱ�䴰
%����s��               �ͻ���ķ���ʱ��
%����dist��            �������
%����v��               ������ʻ�ٶ�
%���civ��             ��rv���뵽rfvc��������Լ���µĲ���ɱ���С��·�߱��
%���cip��             ��ص���Ӧ·���ϵĲ���λ��
%���C��               rv����С����ɱ�
function [civ,cip,C]= cheapest_ip(rv,rfvc,cap,demands,a,b,L,s,dist,v)
NV=size(rfvc,1);                    %����ʹ����Ŀ
outcome=[];                         %�洢ÿһ������Ĳ�����Լ���Ӧ�ľ������� [������� ����λ����� ����ɱ�]
for i=1:NV
    route=rfvc{i};                  %��i��·��
    len=length(route);              %��·�����������˿���Ŀ
    LB=part_length(route,dist);     %����rv֮ǰ����·���ľ���
    %�Ƚ�rv���뵽route�е��κο�϶����(len+1)��,
    for j=1:len+1;
        %��rv���뵽�������ĺ�
        if j==1
            temp_r=[rv route];
            LA=part_length(temp_r,dist);    %����rv֮�����·���ľ���
            delta=LA-LB;                    %����rv֮�����·���ľ�������
            %�жϵ�ǰ·���Ƿ�����ʱ�䴰Լ����������Լ����0��ʾΥ��Լ����1��ʾ����ȫ��Լ��
            flagR=judge_route(temp_r,cap,demands,a,b,L,s,dist,v);    
            %���ͬʱ����ʱ�䴰Լ��������Լ������ò�����������¼����
            if flagR==1
                outcome=[outcome;i j delta];
            end
            %��rv���뵽��������ǰ
        elseif j==len+1
            temp_r=[route rv];
            LA=part_length(temp_r,dist);       %����rv֮�����·���ľ���
            delta=LA-LB;                       %����rv֮�����·���ľ�������
            %�жϵ�ǰ·���Ƿ�����ʱ�䴰Լ����������Լ����0��ʾΥ��Լ����1��ʾ����ȫ��Լ��
            flagR=judge_route(temp_r,cap,demands,a,b,L,s,dist,v);    
            %���ͬʱ����ʱ�䴰Լ��������Լ������ò�����������¼����
            if flagR==1
                outcome=[outcome;i j delta];
            end
            %��rv���뵽�˿�֮��������϶
        else
            temp_r=[route(1:j-1) rv route(j:end)];
            LA=part_length(temp_r,dist);       %����rv֮�����·���ľ���
            delta=LA-LB;                       %����rv֮�����·���ľ�������
            %�жϵ�ǰ·���Ƿ�����ʱ�䴰Լ����������Լ����0��ʾΥ��Լ����1��ʾ����ȫ��Լ��
            flagR=judge_route(temp_r,cap,demands,a,b,L,s,dist,v);    
            %���ͬʱ����ʱ�䴰Լ��������Լ������ò�����������¼����
            if flagR==1
                outcome=[outcome;i j delta];
            end
        end
    end
end
%% ������ں���Ĳ���㣬���ҳ����Ų���㣬����������һ��������
if ~isempty(outcome)
    addC=outcome(:,3);                          %ÿ�������ľ�������
    [saC,sindex]=sort(addC);                    %������������С��������
    temp=outcome(sindex,:);                     %������������С����������[������� ����λ����� ����ɱ�]
    civ=temp(1,1);                              %��һ�м�Ϊ��Ѳ�����Լ���Ӧ�ľ�������
    cip=temp(1,2);
    C=temp(1,3);
else
    civ=NV+1;
    cip=1;
    C=part_length(rv,dist);
end
end