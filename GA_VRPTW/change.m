%% ���ͷ��������֮�����ת��
%����VC��          ���ͷ���
%����N��           Ⱦɫ�峤��
%����cusnum��      �˿���Ŀ
%���individual��  �����ͷ���ת���ɵĸ���
function individual=change(VC,N,cusnum)
NV=size(VC,1);                         %����ʹ����Ŀ
individual=[];
for i=1:NV
    if (cusnum+i)<=N
        individual=[individual,VC{i},cusnum+i];
    else
        individual=[individual,VC{i}];
    end
end
if length(individual)<N               %���Ⱦɫ�峤��С��N������Ҫ��Ⱦɫ������������ı��
    supply=(cusnum+NV+1):N;
    individual=[individual,supply];
end
end