function W = wiener(H, k)

W = (conj(H)./((abs(H).^2) + k));

