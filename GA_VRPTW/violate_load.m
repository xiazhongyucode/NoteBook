%% ���㵱ǰ���ͷ���Υ����װ����Լ��֮��
%����VC��              ���ͷ���
%����demands��         �˿�������
%����cap��             �������װ����
%���q��               ��ǰ���ͷ����и���·��Υ����װ����Լ��֮��
function q=violate_load(VC,demands,cap)
NV=size(VC,1);                      %����ʹ����Ŀ
q=0;
for i=1:NV
    route=VC{i};
    Ld=leave_load(route,demands);   %�����i��·�����뿪��������ʱ��װ����
    if Ld>cap
        q=q+Ld-cap;
    end
end
end