%% ����VC�����FVC����VC�пյ�����·��ɾ��
%����VC��          ���ͷ���
%���FVC��         ɾ����·�ߺ��VC
%���NV��          ����ʹ����Ŀ
function [FVC,NV]=deal_VC(VC)
VC(cellfun(@isempty,VC))=[];  %ɾ��cell�����еĿ�Ԫ��
FVC=VC;                       %��VC��ֵ��fVC
NV=size(FVC,1);               %�·����г���ʹ����Ŀ
end