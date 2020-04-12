im = imread('book.jpg');
im = rgb2gray(im);
figure,imshow(im);
pad = size(im);
im_f = fft2(double(im) , pad(1), pad(2));
im_f_cent=fftshift(im_f);
S1=log(1+abs(im_f_cent)); 
figure,imshow(S1,[]);

r1 = im_f.*motion_blur(pad(1), pad(2), 0.045, 0.045, 1);

i1=real(ifft2(r1));
i1 = i1(1:size(im,1), 1:size(im,2));
image = uint8(i1);
save('blurred_image.mat','image');
figure,imshow(image);

