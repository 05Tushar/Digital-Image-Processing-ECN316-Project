file = load('turbelence_0025.mat');
im = file.i1;
figure,imshow(im);
pad = size(im);
im_f = fft2(double(im) , pad(1), pad(2));

r1 = im_f.*wiener(atmospheric_turbelence(pad(1), pad(2), 0.0025),0);
i1=real(ifft2(r1));
%i1 =uint8(i1);
figure,imshow(i1,[]);

r2 = im_f.*wiener(atmospheric_turbelence(pad(1), pad(2), 0.0025),0.01);
i2=real(ifft2(r2));
i2 =uint8(i2);
figure,imshow(i2);

r3 = im_f.*wiener(atmospheric_turbelence(pad(1), pad(2), 0.0025),0.001);
i3=real(ifft2(r3));
i3 =uint8(i3);
figure,imshow(i3);

r4 = im_f.*wiener(atmospheric_turbelence(pad(1), pad(2), 0.0025),0.0005);
i4=real(ifft2(r4));
i4 =uint8(i4);
figure,imshow(i4);

r5 = im_f.*wiener(atmospheric_turbelence(pad(1), pad(2), 0.0025),0.00025);
i5=real(ifft2(r5));
i5 =uint8(i5);
figure,imshow(i5);

figure;
subplot(2,3,1);imshow(im);title('Original image');
subplot(2,3,2);imshow(i1);title('K = 0');
subplot(2,3,3);imshow(i2);title('K = 0.01');
subplot(2,3,4);imshow(i3);title('K = 0.001');
subplot(2,3,5);imshow(i4);title('K = 0.0005');
subplot(2,3,6);imshow(i5);title('K=0.00025');