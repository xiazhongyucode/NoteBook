%% ��Զ��������ʽ������С����ɱ����Ĺ˿Ͳ�ص���ǰ���ͷ���
%���removed��         ���Ƴ��Ĺ˿ͼ���
%���rfvc��            �ƻ�������ͷ���
%����cap��             �������װ����
%����demands��         �˿�������
%����a��               �˿���ʱ�䴰
%����b��               �˿���ʱ�䴰
%����L��               ����������ʱ�䴰
%����s��               �ͻ���ķ���ʱ��
%����dist��            �������
%����v��               ������ʻ�ٶ�
%���fv��              removed����С����ɱ������Ĺ˿�
%���fviv��            ���ù˿Ͳ�ص���ǰ���ͷ�����·�߱��
%���fvip��            ���ù˿Ͳ�ص���ǰ���ͷ����Ķ�Ӧ·���еĲ���λ��
%���fvC��             �ù˿͵���С����ɱ�
function [fv,fviv,fvip,fvC]=farthest_ins(removed,rfvc,cap,demands,a,b,L,s,dist,v)
nr=length(removed);                     %���Ƴ��Ĺ˿͵�����
outcome=zeros(nr,3);
for i=1:nr
    %[������� ����λ����� ����ɱ�]
    [civ,cip,C]= cheapest_ip(removed(i),rfvc,cap,demands,a,b,L,s,dist,v);
    outcome(i,1)=civ;
    outcome(i,2)=cip;
    outcome(i,3)=C;
end
[mc,mc_index]=max(outcome(:,3));
temp=outcome(mc_index,:);
fviv=temp(1,1);
fvip=temp(1,2);
fvC=temp(1,3);
fv=removed(mc_index);
end