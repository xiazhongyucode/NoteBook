%% ���ݲ��복����ż���·���ϵĲ���λ�ã����˿Ͳ�ص��ƻ������ͷ�����
%����fv��              removed����С����ɱ������Ĺ˿�
%����fviv��            ���ù˿Ͳ�ص���ǰ���ͷ�����·�߱��
%����fvip��            ���ù˿Ͳ�ص���ǰ���ͷ����Ķ�Ӧ·���еĲ���λ��
%����fvC��             �ù˿͵���С����ɱ�
%����rfvc��            �ƻ�������ͷ���
%����dist��            �������
%���ifvc��            ��ع˿ͺ��rfvc
%���iTD��             ��ع˿ͺ��rfvc������ʻ����
function [ifvc,iTD]=insert(fv,fviv,fvip,fvC,rfvc,dist)
ifvc=rfvc;
sumTD=travel_distance(rfvc,dist);               %���ǰ���ܾ���
iTD=sumTD+fvC;                                  %��غ���ܾ���
%% �����س�������rfvc�еĳ���
if fviv<=size(rfvc,1)
    route=rfvc{fviv};                           %���˿Ͳ�ص�·��
    len=length(route);
    if fvip==1
        temp=[fv route];
    elseif fvip==len+1
        temp=[route fv];
    else
        temp=[route(1:fvip-1) fv route(fvip:end)];
    end
    ifvc{fviv}=temp;
%����������һ����
else 
    ifvc{fviv,1}=[fv];
end
end