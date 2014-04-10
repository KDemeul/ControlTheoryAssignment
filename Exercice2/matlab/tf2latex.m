function [ code ] = tf2latex( t )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

syms s
digits(2);
[num,den] = tfdata(t);
t_sym = poly2sym(cell2mat(num),s)/poly2sym(cell2mat(den),s);
code = latex(vpa(t_sym,5));

end

