%% ����һ������·�ߵ���ʻ����
%����route��           ��ǰ����·��
%����dist��            �������
%���p_l��             ��ǰ����·����ʻ����
function p_l=part_length(route,dist)
n=length(route);
p_l=0;
if n~=0
    for i=1:n
        %��Ϊ����������dist�����еĵ�һ�У��У��������ڼ��������ڵ����ʱ��Ҫ�������1
        if i==1
            p_l=p_l+dist(1,route(i)+1);
        else
            p_l=p_l+dist(route(i-1)+1,route(i)+1);
        end
    end
    p_l=p_l+dist(route(end)+1,1);
end
end