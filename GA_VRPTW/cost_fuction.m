%% ���㵱ǰ���ͷ������ܳɱ�
%����VC��              ���ͷ���
%����a��               �˿���ʱ�䴰
%����b��               �˿���ʱ�䴰
%����s��               �ͻ���ķ���ʱ��
%����L��               ����������ʱ�䴰
%����dist��            �������
%����demands��         �˿�������
%����cap��             �������װ����
%����alpha��           Υ��������Լ���ĳͷ�����ϵ��
%����belta��           Υ��ʱ�䴰Լ���ĳͷ�����ϵ��
%����v��               ������ʻ�ٶ�
%���cost��            ��ǰ���ͷ����ܳɱ� f=TD+alpha*q+belta*w
function cost=cost_fuction(VC,a,b,s,L,dist,demands,cap,alpha,belta,v)
TD=travel_distance(VC,dist);        %���㵱ǰ���ͷ�������ʻ����
q=violate_load(VC,demands,cap);     %���㵱ǰ���ͷ����и���·��Υ����װ����Լ��֮��
w=violateTW(VC,a,b,s,L,dist,v);     %���㵱ǰ���ͷ��������й˿�Υ����ʱ�䴰Լ��֮��
cost=TD+alpha*q+belta*w;            %���㵱ǰ���ͷ����ܳɱ�
end