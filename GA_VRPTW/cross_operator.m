%% ��������
%����individual1��     ��1�����������
%����individual2��     ��2�����������
%����individual1��     �����ĵ�1������
%����individual2��     �����ĵ�2������
function [individual1,individual2]=cross_operator(individual1,individual2)
L=length(individual1);          %���峤��
while 1
    r1=randsrc(1,1,[1:L]);
    r2=randsrc(1,1,[1:L]);
    if r1~=r2
        s=min([r1,r2]);
        e=max([r1,r2]);
        a0=[individual2(s:e),individual1];
        b0=[individual1(s:e),individual2];
        for i=1:length(a0)
            aindex=find(a0==a0(i));
            bindex=find(b0==b0(i));
            if length(aindex)>1
                a0(aindex(2))=[];
            end
            if length(bindex)>1
                b0(bindex(2))=[];
            end
            if i==length(individual1)
                break
            end
        end
        individual1=a0;
        individual2=b0;
        break
    end
end
end