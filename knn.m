J = imread("images/mri2.jpg");J = rgb2gray( J );I = medfilt3(J);
imshow(I);
roi1 = drawpoint('Color','r');
roi2 = drawpoint('Color','g');
roi3 = drawpoint('Color','b');
roi4 = drawpoint('Color','y');

ColorOfpoint1 = I(int16(roi1.Position(2)),int16(roi1.Position(1)));
ColorOfpoint2 = I(int16(roi2.Position(2)),int16(roi2.Position(1)));
ColorOfpoint3 = I(int16(roi3.Position(2)),int16(roi3.Position(1)));
ColorOfpoint4 = I(int16(roi4.Position(2)),int16(roi4.Position(1)));

neighbours = [ColorOfpoint1,ColorOfpoint2,ColorOfpoint3,ColorOfpoint4];

color_red =   [1];color_red(:,:,2) =   [0];color_red(:,:,3) = [0];
color_green = [0];color_green(:,:,2) = [1];color_green(:,:,3) = [0];
color_blue =  [0];color_blue(:,:,2) =  [0];color_blue(:,:,3) = [1];
color_yellow =[1];color_yellow(:,:,2) =[1];color_yellow(:,:,3) = [0];   

colors = [color_red,color_green,color_blue,color_yellow];

I_shape = size(I);
segmentedImg = zeros(I_shape(1),I_shape(2),3);

for i =1:I_shape(1)
    for j=1:I_shape(2)
        [out,idx] = sort(int16(neighbours - I(i,j)));
        segmentedImg(i,j,:) = colors(1,idx(1),:);
    end
end

imshow(segmentedImg);
imshowpair(I,segmentedImg,'montage');
