%% �������
%����Chrom��           ������Ⱥ
%����SelCh��           �Ӵ���Ⱥ
%����fit��             ������Ӧ��
%���Chrom��           ��ϸ������Ӵ���õ�������Ⱥ
function Chrom=reins(Chrom,SelCh,fit)
NIND=size(Chrom,1);
NSel=size(SelCh,1);
[~,index]=sort(fit,'descend');
Chrom=[Chrom(index(1:NIND-NSel),:);SelCh];
end