%% ����ĳһ��·�����뿪��������ʱ��װ����
%����route��           ��ǰ����·��
%����demands��         �˿�������
%���Ld��              �����뿪��������ʱ��װ����
function Ld=leave_load(route,demands)
n=length(route);       %����·�߾����˿͵���Ŀ
Ld=0;                  %��ʼ��������������ʱ��װ����Ϊ0
if n~=0
    for i=1:n
        if route(i)~=0
            Ld=Ld+demands(route(i));
        end
    end
end
end