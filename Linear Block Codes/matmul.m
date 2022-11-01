function [C] = matmul(A,B)
 [n,m] = size(A);
 [m1,k] = size(B);

 if (m ~= m1)
     error('Incompatible Matrices');
     return;
 end

C = mod((A * B), 2);

end