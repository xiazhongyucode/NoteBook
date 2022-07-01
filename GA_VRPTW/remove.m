%% �ƻ��������ȴ�ԭ�й˿ͼ��������ѡ��һ���˿ͣ�Ȼ�����������������Ƴ���Ҫ�����Ĺ˿�
%����cusnum��          �˿���Ŀ
%����toRemove��        ��Ҫ�Ƴ��Ĺ˿���Ŀ
%����D��               ���Ԫ��
%����dist��            �������
%����VC��              �ƻ�ǰ�����ͷ���
%���removed��         ���Ƴ��Ĺ˿ͼ���
%���rfvc��            �ƻ�������ͷ���
function [removed,rfvc]=remove(cusnum,toRemove,D,dist,VC)
inplan=1:cusnum;                    %���й˿͵ļ���
visit=ceil(rand*cusnum);            %��������й˿������ѡ��һ���˿�
inplan(inplan==visit)=[];           %�����Ƴ��Ĺ˿ʹ�ԭ�й˿ͼ������Ƴ�
removed=[visit];                    %���Ƴ��Ĺ˿ͼ���
while length(removed)<toRemove
    nr=length(removed);             %��ǰ���Ƴ��Ĺ˿�����
    vr=ceil(rand*nr);               %�ӱ��Ƴ��Ĺ˿ͼ��������ѡ��һ���˿�
    nip=length(inplan);             %ԭ���˿ͼ����й˿͵�����
    R=zeros(1,nip);                 %�洢removed(vr)��inplan��ÿ��Ԫ�ص�����Ե�����
    for i=1:nip
        R(i)=relatedness(removed(vr),inplan(i),dist,VC);   %����removed(vr)��inplan��ÿ��Ԫ�ص������
    end
    [SRV,SRI]=sort(R,'descend');        
    lst=inplan(SRI);                %��inplan�е����鰴removed(vr)���������ԴӸߵ�������
    vc=lst(ceil(rand^D*nip));       %��lst������ѡ��һ���ͻ�
    removed=[removed vc];           %���Ƴ��Ĺ˿ͼ�������ӱ��Ƴ��Ĺ˿�
    inplan(inplan==vc)=[];          %�����Ƴ��Ĺ˿ʹ�ԭ�й˿ͼ������Ƴ�
end
rfvc=VC;                            %�Ƴ�removed�еĹ˿ͺ��final_vehicles_customer
nre=length(removed);                %���ձ��Ƴ��˿͵�������
NV=size(VC,1);                      %����ʹ����Ŀ
for i=1:NV
    route=VC{i};
    for j=1:nre
        findri=find(route==removed(j),1,'first');
        if ~isempty(findri)
            route(route==removed(j))=[];
        end
    end
    rfvc{i}=route;
end
rfvc=deal_VC(rfvc);
end