%% ��˿�i��˿�j֮��������
%����i,j��             �˿�
%����dist��            �������
%����VC��              ���ͷ���
%���Rij��             �˿�i�͹˿�j�������
function Rij=relatedness(i,j,dist,VC)
n=size(dist,1)-1;       %�˿�������-1����Ϊ��ȥ��������
NV=size(VC,1);          %����ʹ����Ŀ
%����cij'
d=dist(i+1,j+1);
[md,mindex]=max((dist(i+1,2:end)));
c=d/md;
%�ж�i��j�Ƿ���һ��·����
V=1;                    %���ʼ�˿�i��˿�j����ͬһ��·����
for k=1:NV
    route=VC{k};        %����·���Ͼ����Ĺ˿�
    findi=find(route==i,1,'first');     %�жϸ���·�����Ƿ񾭹��˿�i
    findj=find(route==j,1,'first');     %�жϸ���·�����Ƿ񾭹��˿�j
    %���findi��findjͬʱ�ǿգ���֤������·����ͬʱ�����˿�i�͹˿�j����V=0
    if ~isempty(findi)&&~isempty(findj)
        V=0;
    end
end
%����˿�i��˿�j�������
Rij=1/(c+V);
end