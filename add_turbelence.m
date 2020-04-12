im = imread('iitr.png');
im = rgb2gray(im);
figure,imshow(im);
pad = size(im);
im_f = fft2(double(im) , pad(1), pad(2));
im_f_cent=fftshift(im_f);
S1=log(1+abs(im_f_cent)); 
figure,imshow(S1,[]);

r1 = im_f.*atmospheric_turbelence(pad(1), pad(2), 0.0025);
r2 = im_f.*atmospheric_turbelence(pad(1), pad(2), 0.001);
r3 = im_f.*atmospheric_turbelence(pad(1), pad(2), 0.00025);

i1=real(ifft2(r1));
i2=real(ifft2(r2));
i3=real(ifft2(r3));

i1 = uint8(i1);
i2 = uint8(i2);
i3 = uint8(i3);
save('turbelence_0025.mat','i1');
save('turbelence_001.mat','i2');
save('turbelence_00025.mat','i3');
figure,imshow(i1);
figure,imshow(i2);
figure,imshow(i3);

figure;
subplot(2,2,1);imshow(im);title('Original image');
subplot(2,2,2);imshow(i1);title('K = 0.0025');
subplot(2,2,3);imshow(i2);title('K = 0.001');
subplot(2,2,4);imshow(i3);title('K = 0.00025');