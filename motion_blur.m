function H = motion_blur(M, N, a,b,T)
[U, V] = dftuv(M, N);

% Compute the distances D(U, V).
D = pi*(U*a + V*b);
[row, col] =find(D==0);
H = T*(sin(D)./D).*(exp(-D*1i));

for i=1:size(row,1)
    H(row(i),col(i)) = T;
end

H(1,1) = T;