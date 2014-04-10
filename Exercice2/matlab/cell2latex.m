function [ code ] = cell2latex( c )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


code = ['\left(\begin{array}{cc} ',tf2latex(c(1,1)),' & ',tf2latex(c(1,2)),' \\ ',tf2latex(c(2,1)),' & ',tf2latex(c(2,2)),' \\ \end{array}\right)'];

end

