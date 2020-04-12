im = imread('noiseball.png');
%im = rgb2gray(im);
figure,imshow(im);
pad = 2*size(im);
im_f = fft2(double(im) , pad(1), pad(2));
im_f_cent=fftshift(im_f);
S1=log(1+abs(im_f_cent)); 
figure,imshow(S1,[]);

D0 = 10; %Value of D0
%The position of notches is picked directly from the FFT and then shifting
%to original position
f1 = notch('btw', pad(1), pad(2), D0, 50, 100);
f2 = notch('btw', pad(1), pad(2), D0, 1, 400);
f3 = notch('btw', pad(1), pad(2), D0, 620, 100);
f4 = notch('btw', pad(1), pad(2), D0, 22, 414);
f5 = notch('btw', pad(1), pad(2), D0, 592, 414);
f6 = notch('btw', pad(1), pad(2), D0, 1, 114);
f = f1.*f2.*f3.*f4.*f5.*f6;
inv_f = 1-f;
filtered_response = im_f.*f1.*f2.*f3.*f4.*f5.*f6;
noise = im_f.*inv_f;
noise_spat = real(ifft2(noise));
noise_spat = noise_spat(1:size(im,1), 1:size(im,2));
figure,imshow(noise_spat,[]);
%Display the filtered response
filtered_response_cent = fftshift(filtered_response);
s2 = log(1+abs(filtered_response_cent)); 
figure, imshow(s2,[]);

%Now taking the inverse fourier transform 
filtered_image_padded=real(ifft2(filtered_response));
filtered_image = filtered_image_padded(1:size(im,1), 1:size(im,2));
figure,imshow(filtered_image, []);