%% �������
%����SelCh��       ��ѡ�е��Ӵ���Ⱥ
%����Pc��          �������
%���SelCh��       �������Ӵ���Ⱥ
function SelCh=crossover(SelCh,Pc)
NSel=size(SelCh,1);
for i=1:2:NSel-mod(NSel,2)
    if Pc>=rand %�������Pc
        [SelCh(i,:),SelCh(i+1,:)]=cross_operator(SelCh(i,:),SelCh(i+1,:));
    end
end
end