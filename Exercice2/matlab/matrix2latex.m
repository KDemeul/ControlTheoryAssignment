function [ code ] = matrix2latex( M )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

digits(2)

code = latex(vpa(sym(M)));

end

