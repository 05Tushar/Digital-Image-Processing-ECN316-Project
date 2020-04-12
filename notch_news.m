im = imread('yuvi.tif');
im = rgb2gray(im);
figure,imshow(im);
a = size(im);
pad = 2*size(im);
im_f = fft2(double(im) , pad(1), pad(2));
im_f_cent=fftshift(im_f);
S1=log(1+abs(im_f_cent)); 
figure,imshow(S1,[]);


cord = [3691 , 1837;
    3959,1928;
    4118,2089;
    4124,2279;
    3977,2445;
    3715,2543;
    3409,2547;
    3141,2456;
    2982,2294;
    2976,2105;
    3123,1939;
    3385,1841];

filtered_response = im_f;
D0 = 30; %Value of D0
for i=1:12
    c_x = mod((cord(i,1)+a(2)),pad(2));
    c_y = mod((cord(i,2)+a(1)),pad(1));
    f = notch('gaussian', pad(1), pad(2), D0,c_x ,c_y);
    filtered_response = filtered_response.*f;
end

%Display the filtered response
filtered_response_cent = fftshift(filtered_response);
s2 = log(1+abs(filtered_response_cent)); 
figure, imshow(s2,[]);

%Now taking the inverse fourier transform 
filtered_image_padded=real(ifft2(filtered_response));
filtered_image = filtered_image_padded(1:size(im,1), 1:size(im,2));
filtered_image = uint8(filtered_image);
figure,imshow(filtered_image);