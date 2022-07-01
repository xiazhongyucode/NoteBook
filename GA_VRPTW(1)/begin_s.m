%
%      @作者：随心390
%      @微信公众号：优化算法交流地
%
%% 计算一条路线上车辆对顾客的开始服务时间，还计算车辆返回集配中心的时间
%输入route：       一条配送路线
%输入a：           最早开始服务的时间窗
%输入s：           对每个点的服务时间
%输入dist：        距离矩阵
%输出bs：          车辆对顾客的开始服务时间
%输出back：        车辆返回集配中心的时间

function [bs,back]= begin_s( route,a,s,dist )
n=length(route);                        %配送路线上经过顾客的总数量
bs=zeros(1,n);                          %车辆对顾客的开始服务时间


bs(1)=max(a(route(1)),dist(1,route(1)+1));
for i=1:n
    if i~=1
        bs(i)=max(a(route(i)),bs(i-1)+s(route(i-1))+dist(route(i-1)+1,route(i)+1));
    end
end
back=bs(end)+s(route(end))+dist(route(end)+1,1);

end

