%% �������
%����SelCh��       ��ѡ�е��Ӵ���Ⱥ
%����Pm��          �������     
%���SelCh��       �������Ӵ���Ⱥ
function SelCh=mutate(SelCh,Pm)
NSel=size(SelCh,1);
for i=1:NSel
    if Pm>=rand
        individual1=SelCh(i,:);
        individual2=mutate_operator(individual1);
        SelCh(i,:)=individual2;
    end
end
end