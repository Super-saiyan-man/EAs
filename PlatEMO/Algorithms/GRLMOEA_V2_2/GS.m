function [G,d] = GS(P,x_lower,x_upper,K)
%GS Algorithm 1: Grid-system Setup
%   Input : P: the current population; 
%   z_star: the approximation of the ideal point; 
%   z_nad: the approximation of the nadir point; 
%   m: the number of 
%   K: the number of the intervals on each

    sigma = 1e-11;
    d = (x_upper - x_lower)/K;
%     d = (x_upper-x_lower+2*sigma)/K;         
    G = ceil((P.decs-x_lower+sigma)./d);
end
