function [ code ] = celltf2latex( c )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

code = [];
for i=1:size(c,1)
    si = [];
    for j=1:size(c,2)
        si = [si,'c'];
        code = [code,tf2latex(c(i,j))];
        if j~=size(c,2)
            code = [code,' & '];
        end
    end
    if i ~=size(c,1)
        code = [code,' \\ '];
    end
end

code = ['\left(\begin{array}{',si,'} ',code,' \\ \end{array}\right)'];

end

