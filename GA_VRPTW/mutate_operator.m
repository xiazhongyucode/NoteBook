%% ��������
%����individual1��     ���������
%���individual2��     �����ĸ���
function individual2=mutate_operator(individual1)
n=length(individual1);
seq=randperm(n);
I=seq(1:2);
i1=I(1);
i2=I(2);
individual2=individual1;
individual2([i1 i2])=individual1([i2 i1]);
end