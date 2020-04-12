function H = atmospheric_turbelence(M, N, k)
[U, V] = dftuv(M, N);

% Compute the distances D(U, V).
D = U.^2 + V.^2;
H = exp(-k*(D.^(5/6)));

