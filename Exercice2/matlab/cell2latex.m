function [ code ] = cell2latex( c )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here


code = ['\left(\begin{array}{cc} ',matrix2latex(c{1,1}),' & ',matrix2latex(c{1,2}),' \\ ',matrix2latex(c{2,1}),' & ',matrix2latex(c{2,2}),' \\ \end{array}\right)'];

end

