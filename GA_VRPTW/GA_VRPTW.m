tic
clear
clc
%% ��xlsread��������ȡxlsx�ļ�
dataset=xlsread('ʵ����֤����.xlsx','ת��������','A2:G17');
cap=150;                                                                %�������װ����
v=30/60;                                                                %������ʻ�ٶ�=30km/h=30/60km/min
%% ��ȡ������Ϣ
E=dataset(1,5);                                                         %��������ʱ�䴰��ʼʱ��
L=dataset(1,6);                                                         %��������ʱ�䴰����ʱ��
vertexs=dataset(:,2:3);                                                 %���е������x��y
customer=vertexs(2:end,:);                                              %�˿�����
cusnum=size(customer,1);                                                %�˿���
v_num=min(25,cusnum);                                                   %�������ʹ����Ŀ
demands=dataset(2:end,4);                                               %������
a=dataset(2:end,5);                                                     %�˿�ʱ�䴰��ʼʱ��[a[i],b[i]]
b=dataset(2:end,6);                                                     %�˿�ʱ�䴰����ʱ��[a[i],b[i]]
s=dataset(2:end,7);                                                     %�ͻ���ķ���ʱ��
h=pdist(vertexs);                                                       %��������ڵ�֮��ľ���
dist=squareform(h);                                                     %�������
%% �Ŵ��㷨��������
alpha=10;                                                               %Υ��������Լ���ĳͷ�����ϵ��
belta=100;                                                              %Υ��ʱ�䴰Լ���ĳͷ�����ϵ��
NIND=50;                                                                %��Ⱥ��С
MAXGEN=250;                                                             %��������
Pc=0.9;                                                                 %�������
Pm=0.05;                                                                %�������
N=cusnum+v_num-1;                                                       %Ⱦɫ�峤��=�˿���Ŀ+�������ʹ����Ŀ-1
%% ��ʼ����Ⱥ
init_vc=init(cusnum,a,demands,cap);                                     %�����ʼ��
Chrom=init_pop(NIND,N,cusnum,init_vc);
%% ���������·�ߺ��ܾ���
disp('��ʼ��Ⱥ�е�һ�����ֵ:')
[VC,NV,TD,violate_num,violate_cus]=decode(Chrom(1,:),cusnum,cap,demands,a,b,L,s,dist,v);
disp(['����ʹ����Ŀ��',num2str(NV),'��������ʻ�ܾ��룺',num2str(TD),'��Υ��Լ��·����Ŀ��',num2str(violate_num),'��Υ��Լ���˿���Ŀ��',num2str(violate_cus)]);
disp('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
%% �Ż�
gen=1;
bestChrom=Chrom(1,:);                                                   %��ʼȫ�����Ÿ���
bestVC=decode(bestChrom,cusnum,cap,demands,a,b,L,s,dist,v);             %��ʼȫ�����Ÿ�������������ͷ���
bestCost=cost_fuction(bestVC,a,b,s,L,dist,demands,cap,alpha,belta,v);   %��ʼȫ�����Ÿ�����ܳɱ�       
BestChrom=zeros(MAXGEN,N);                                              %��¼ÿ�ε���������ȫ�����Ÿ���
BestCost=zeros(MAXGEN,1);                                               %��¼ÿ�ε���������ȫ�����Ÿ�����ܳɱ�
while gen<=MAXGEN
    %% ���㵱ǰ�����и����Ŀ�꺯��ֵ
    Obj=cal_obj(Chrom,cusnum,cap,demands,a,b,L,s,dist,alpha,belta,v);
    %% ������Ⱥ��Ӧ��ֵ
    fit=fitness(Obj);
    %% ѡ��
    SelCh=binary_tourment_select(Chrom,cusnum,cap,demands,a,b,L,s,dist,alpha,belta,v);
    %% �������
    SelCh=crossover(SelCh,Pc);
    %% ����
    SelCh=mutate(SelCh,Pm);
    %% �ֲ���������
    SelCh=local_search(SelCh,cusnum,cap,demands,a,b,L,s,dist,alpha,belta,v);
    %% �ز����Ӵ�������Ⱥ
    Chrom=reins(Chrom,SelCh,Obj);
    %% ���㵱ǰ�����и����ܳɱ�
    Obj=cal_obj(Chrom,cusnum,cap,demands,a,b,L,s,dist,alpha,belta,v); 
    %% �ҳ���ǰ�������Ÿ���
    [minObj,minIndex]=min(Obj);
    %% ����ǰ�������Ÿ�����ȫ�����Ÿ�����бȽϣ������ǰ�����Ÿ�����ã���ȫ�����Ÿ�������滻
    if minObj<=bestCost
        bestChrom=Chrom(minIndex(1),:);
        bestCost=minObj;
    end
    %��¼ÿһ��ȫ�����Ÿ��壬�����ܾ���
    BestChrom(gen,:)=bestChrom;
    BestCost(gen,:)=bestCost;
    %% ��ӡ��ǰ���Ž�
    disp(['��',num2str(gen),'�����Ž�:'])
    [bestVC,bestNV,bestTD,best_vionum,best_viocus]=decode(bestChrom,cusnum,cap,demands,a,b,L,s,dist,v);
    disp(['����ʹ����Ŀ��',num2str(bestNV),'��������ʻ�ܾ��룺',num2str(bestTD),'��Υ��Լ��·����Ŀ��',num2str(best_vionum),'��Υ��Լ���˿���Ŀ��',num2str(best_viocus)]);
    fprintf('\n')
    %% ���µ�������
    gen=gen+1 ;
end
%% ��ӡÿ�ε�����ȫ�����Ÿ�����ܾ���仯����ͼ
figure;
plot(BestCost,'LineWidth',1);
title('�Ż�����')
xlabel('��������');
ylabel('�ܳɱ�');
%% ������Ž��·�ߺ��ܾ���
disp('���Ž�:')
[bestVC,bestNV,bestTD,best_vionum,best_viocus]=decode(bestChrom,cusnum,cap,demands,a,b,L,s,dist,v);
disp(['����ʹ����Ŀ��',num2str(bestNV),'��������ʻ�ܾ��룺',num2str(bestTD),'��Υ��Լ��·����Ŀ��',num2str(best_vionum),'��Υ��Լ���˿���Ŀ��',num2str(best_viocus)]);
disp('-------------------------------------------------------------')
%% ��������·��ͼ
draw_Best(bestVC,vertexs);
save solution.mat bestVC bestNV bestTD
toc