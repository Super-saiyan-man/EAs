function [G,d] = GS(P,x_star,x_nad,K)
%GS Algorithm 1: Grid-system Setup
%   Input : P: the current population; 
%   z_star: the approximation of the ideal point; 
%   z_nad: the approximation of the nadir point; 
%   m: the number of 
%   K: the number of the intervals on each

    sigma = 1e-11;
    d = (x_nad-x_star+2*sigma)/K;         
    G = ceil((P.decs-x_star+sigma)./d);
end
