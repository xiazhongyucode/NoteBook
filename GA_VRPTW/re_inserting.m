%% �޸������������Ƴ��Ĺ˿����²�����ƻ�������ͷ���
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
%���ReIfvc��          �޸�������ͷ���
%���RTD��             �޸�������ͷ���������ʻ����
function [ReIfvc,RTD]=re_inserting(removed,rfvc,cap,demands,a,b,L,s,dist,v)
while ~isempty(removed)
    %% ��Զ��������ʽ������С����ɱ����Ĺ˿Ͳ�ص���ǰ���ͷ���
    [fv,fviv,fvip,fvC]=farthest_ins(removed,rfvc,cap,demands,a,b,L,s,dist,v);
    removed(removed==fv)=[];
    %% ���ݲ���㽫Ԫ�ز�ص�ԭʼ����
    rfvc=insert(fv,fviv,fvip,fvC,rfvc,dist);
end
rfvc=deal_VC(rfvc);
ReIfvc=rfvc;
RTD=travel_distance( ReIfvc,dist);
end