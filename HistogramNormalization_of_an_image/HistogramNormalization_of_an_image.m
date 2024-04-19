img = rgb2gray(imread('wal1.jpg'));
img2 = img;

for x1=1:256
    hist_new(x1)=0;
end


for i=1:168
    for j=1:300
        hist_new(img(i,j)+1)= hist_new(img(i,j)+1)+1;
    end
end

count=0;

cdf(1) = 0;

for y1=1:256
    pdf(y1) = (hist_new(y1)/50400);
    
    if y1==1
        cdf(1)=pdf(1);
    else
        cdf(y1)= cdf(y1-1)+pdf(y1);
    end
    %disp(cdf(y1));
end




for z1=1:256
    new_int(z1) = round(cdf(z1)*255);
end

for i=1:168
    for j=1:300
        img2(i,j) = new_int(img(i,j)+1);
    end
end

figure(1);
imshow(img);

figure(2);
imshow(img2);