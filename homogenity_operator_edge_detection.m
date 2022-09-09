%% Edge detection using homogeneity operator
% Ref: A new homogeneity-based approach to edge detection using PSO
% Mahdi Setayesh, Mengjie Zhang and Mark Johnston
clear all;clc;close all;
img=imread('140828085042_st.png');
% img=rgb2gray(imread('peppers.png'));

[m,n]=size(img);

newimg=zeros(m,n);
for i=2:m-1
    for j=2:n-1
        newimg(i,j)=max([abs(img(i,j)-img(i-1,j-1)),...
            abs(img(i,j)-img(i,j-1)),...
            abs(img(i,j)-img(i-1,j)),...
            abs(img(i,j)-img(i+1,j+1)),...
            abs(img(i,j)-img(i+1,j)),...
            abs(img(i,j)-img(i,j+1)),...
            abs(img(i,j)-img(i+1,j-1)),...
            abs(img(i,j)-img(i-1,j+1))]);
    end
end
th=graythresh(img)*max(img(:)); % threshold calculation by otsu method
subplot(121)
imshow(img);
title('Original Image');
subplot(122);
imshow(newimg>th/4);
title('Homogenity Operator Output');

% higher the homogenity factor, better the edge