%% ����VRPTW��ʼ��
%����cusnum��      �˿���Ŀ
%����a��           �˿���ʱ�䴰
%����demands��     �˿�������
%����cap��         �������װ����
%���init_vc��     ��ʼ��
function init_vc=init(cusnum,a,demands,cap)
j=ceil(rand*cusnum);                    %�����й˿������ѡ��һ���˿�
k=1;                                    %ʹ�ó�����Ŀ����ʼ����Ϊ1
init_vc=cell(k,1);
% �����������У�����ÿ���˿ͣ���ִ�����²���
if j==1
    seq=1:cusnum;
elseif j==cusnum
    seq=[cusnum,1:j-1];
else
    seq1=1:j-1;
    seq2=j:cusnum;
    seq=[seq2,seq1];
end
% ��ʼ����
route=[];       %�洢ÿ��·���ϵĹ˿�
load=0;         %��ʼ·�����ڲֿ��װ����Ϊ0
i=1;
while i<=cusnum
    %���û�г�������Լ����������ʱ�䴰��С�����˿���ӵ���ǰ·��
    if load+demands(seq(i))<=cap
        load=load+demands(seq(i));          %��ʼ�ڲֿ��װ��������
        %�����ǰ·��Ϊ�գ�ֱ�ӽ��˿���ӵ�·����
        if isempty(route)
            route=[seq(i)];
            %�����ǰ·��ֻ��һ���˿ͣ�������¹˿�ʱ����Ҫ������ʱ�䴰��С�������
        elseif length(route)==1
            if a(seq(i))<=a(route(1))
                route=[seq(i),route];
            else
                route=[route,seq(i)];
            end
        else
            lr=length(route);       %��ǰ·������,����lr-1�������Ĺ˿�
            flag=0;                 %����Ƿ��������1�Թ˿ͣ�����seq(i)��������֮��
            if a(seq(i))<a(route(1))
                route=[seq(i),route];
            elseif a(seq(i))>a(route(end))
                route=[route,seq(i)];
            else
                %������lr-1�������Ĺ˿͵��м����λ��
                for m=1:lr-1
                    if (a(seq(i))>=a(route(m)))&&(a(seq(i))<=a(route(m+1)))
                        route=[route(1:m),seq(i),route(m+1:end)];
                        break
                    end
                end
            end
        end
        %������������һ���˿ͣ������init_vc������������
        if i==cusnum
            init_vc{k,1}=route;
            break
        end
        i=i+1;
    else   %һ����������װ����Լ��������Ҫ����һ����
        %�ȴ�����һ�����������Ĺ˿�
        init_vc{k,1}=route;
        %Ȼ��route��գ�load����,k��1
        route=[];
        load=0;
        k=k+1;
    end
end
end