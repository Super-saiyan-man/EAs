function [P] = RBS_xu(Q,G,n)
%RBS ��������������������ѡȡǰn�������ȺP
%   ���룺��ȺQ�������������G������������n
%   �������������ȺP
    %% �ȶԸ����������Ŀ������
    f = Q.objs;         % Ŀ�����
    [nq, m] = size(f);
    R = zeros(nq,m); % ÿ�������ڸ�ά�ȵ����
    for i = 1:nq
        for j = 1:m
            % ��������������ǰ����ˣ��Ͳ�Ҫ�ظ�������
            if R(i,j) ~= 0
                continue
            end
            id = true;  % �ȼ������и��嶼��i����ͬһ������
            % Ҫ�ҵ�������i����ͬһ������ĸ���
            for t = 1:m
                if t==j % ���Ե�ǰά��,������ά�ȵ���������������
                    continue
                end
                id = id & (G(:,t)==G(i,t));
            end
            s = f(id,:);    % ѡ��������ͬ������ĸ����Ŀ��ֵ
%             disp(j)
            [~,I] = sortrows(s,j);    % ����j��Ŀ������
            rank = (1:size(s,1));
            rank = rank(I);
            R(id,j) = rank;
        end
    end
    %% ��R���д������P
    R = sort(R,2);              % ��ÿ�и�������
    [~,I] = sortrows(R); % �ֵ�����
    id = I(1:n);
    P = Q(id);
end