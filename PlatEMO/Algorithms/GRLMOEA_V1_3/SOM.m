function [output] = SOM(data)
%SOM �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%somʵ��
%2016-11-12
%by wangbaojia
%  somԭ������˵��
% 1.������ƥ�������Ԫ---------->����ÿ�������ͳ�ʼ������ľ��룬���������Ԫ��Ϊ��ʤ��Ԫ
%
% 2.��������Ȩֵ���¹����У�������ʤ��Ԫ��Ȩ
%ֵ�����õ����£������������Ԫ��Ȩֵ����Ҳ����ĳ�������ں��������и��¡������ڿ�
%ʼʱ�ƶ����ܴ�Ȩֵ�������µؿɰ����ǵ�����λ��������
%��ʤ��Ԫ�����˷���Ԫ����������Ŀռ�λ��,�Ӷ��ṩ��������Ԫ�����Ļ���
%   �������򣺹�������һ�㶼������Ϊ������״,���õ���Ҫ�������λ�������,�����θ�Ϊ�ձ�
%
%Ȩ�������ĵ����ͷ����ڻ�ʤ��Ԫ�������ڡ���ѵ���ĸտ�ʼ�׶�,�������Ƚϴ�,
%����ѵ���Ľ���,�������ʼ���ϼ�С
%
% 3.����Ӧ��Ȩֵ���¹���
% �㷨��
% 1.��ʼ��
%    1)����������ʱ�䲽��iter
%    2)������Ȩֵ������ʼֵ,������Ԫ�ؿ�ѡ����(0��1)�ϵ����ֵ,����ѡ������������
%    3)ѧϰ�ʳ�ʼֵ
%    4)����뾶������Ӧ���������϶������Ԫ,�������ƽ���һ��
% 2.������ʤ��Ԫ;ŷ�����뺯�����
% 3.Ȩֵ���£�
%        ��ʤ�ڵ������Χ����Ԫ���ϵ�m���ڵ����Ȩֵ��j=1:m��
%            wj(t+1)=wj(t)+learnfun(t)*neighborfun(t)*(x-wj);
% 4.����ѧϰ�ʣ�����������
%        neighborfun(t)=neighbor0*exp(-dij/t1);   t1=iter/log(neighbor0)
%         learnfun(t)=learn0*exp(-t/t2);     t2=iter
% 5.������ӳ�䲻�ٷ������Ա仯ʱ��ﵽ�������ѵ������ʱ�˳�,����ת���2��

%�������ݣ�data����ÿһ��Ϊһ���ÿո����ֵĶ�ά��������
tic;
[data_row,data_clown]=size(data);

%����֯ӳ������m*n
m=5;
n=5;
%��Ԫ�ڵ�����som_sum
som_sum=m*n;
%Ȩֵ��ʼ���������ʼ��
w = rand(som_sum, data_clown);
%��ʼ��ѧϰ��
learn0 = 0.6;
learn_rate = learn0;
%ѧϰ�ʲ���
learn_para=1000;
%���õ�������
iter =500;
%��Ԫλ��
[I,J] = ind2sub([m, n], 1:som_sum);
%�����ʼ��
neighbor0 =2;
neighbor_redius = neighbor0;
%�������
neighbor_para = 1000/log(neighbor0);

%��������
for t=1:iter
    %  ���������
    for j=1:data_row
        %��ȡ������ֵ
        data_x = data(j,:);
        %�ҵ���ʤ��Ԫ
        [win_row, win_som_index]=min(dist(data_x,w'));
        %��ʤ��Ԫ������λ��
        [win_som_row,win_som_cloumn] =  ind2sub([m, n],win_som_index);
        win_som=[win_som_row,win_som_cloumn];
        %����������Ԫ�ͻ�ʤ��Ԫ�ľ���,������
        %distance_som = sum(( ([I( : ), J( : )] - repmat(win_som, som_sum,1)) .^2) ,2);
        distance_som = exp( sum(( ([I( : ), J( : )] - repmat(win_som, som_sum,1)) .^2) ,2)/(-2*neighbor_redius*neighbor_redius)) ;
        %Ȩֵ����
        for i = 1:som_sum
            % if distance_som(i)<neighbor_redius*neighbor_redius
            w(i,:) = w(i,:) + learn_rate.*distance_som(i).*( data_x - w(i,:));
        end
    end
    
    %����ѧϰ��
    learn_rate = learn0 * exp(-t/learn_para);
    %��������뾶
    neighbor_redius = neighbor0*exp(-t/neighbor_para);
end
%data��������Ԫ��ӳ��
%��Ԫ����som_num�洢ͼ����
som_num=cell(1,size(w,1));
for i=1:size(w,1)
    som_num{1,i}=[];
end
%ÿ����Ԫ�ڵ��Ӧ��data�������
for num=1:data_row
    [som_row,clown]= min(sum(( (w - repmat(data(num,:), som_sum,1)) .^2) ,2));
    som_num{1,clown}= [som_num{1,clown},num];
end

%�洢��Ԫ���飬.mat��ʽ
path1=strcat(file_path,'som_num.mat');
save(path1,'som_num');
toc;
end

