function H = motion_blur_ltd(M, N, a,b,T, k)
[U, V] = dftuv(M, N);
D1 = sqrt(U.^2 + V.^2);
% Compute the distances D(U, V).
D = pi*(U*a + V*b);
[row, col] =find(D==0);
H = T*(sin(D)./D).*(exp(-D*1i));

for i=1:size(row,1)
    H(row(i),col(i)) = T;
end

[row1, col1] = find(D1>=k);
for i=1:size(row1,1)
    H(row1(i),col1(i)) = 1;
end
