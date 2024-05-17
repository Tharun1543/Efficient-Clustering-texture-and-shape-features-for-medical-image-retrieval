clear 
close all
clc
clk=1;
M=100;
query_images = cell(1, M);
for i = 1:M
    filename = [int2str(i), '.jpeg'];
    query_images{i} = imread("medical_image1.jpg");
end
figure(13);
for i = 1:M
    subplot(10, 10, i);
    imshow(query_images{i});
    %title(['Query Image ', num2str(i)]);
end
for i=1:M
    str = strcat(int2str(i), '.jpeg');
    img = imread("medical_image.jpg");
    
    %img = imread('medical_Image.jpg');
    
    figure(1),imshow(img)
    img1=rgb2hsv(img);
    figure(2),imshow(img1)
    [h, s v]=rgb2hsv(img);
    
%    title("Original Image");
    I2= imresize(v,[208,208]);  
    m=size(I2,1);
    n=size(I2,2);
    I3=[]; I31=[];I32=[]; I4=[];I41=[];I42=[];I43=[];I44=[];BPIE1=[];
    c1=1;
    for i=3:m-3
        for j=3:n-3
        J0=I2(i,j); 
        %Inner 
        I3(1,c1)=(J0-I2(i,j+1));
        I3(2,c1)=(J0-I2(i-1,j+1));
        I3(3,c1)=(J0-I2(i-1,j));
        I3(4,c1)=(J0-I2(i-1,j-1));
        I3(5,c1)=(J0-I2(i,j-1));
        I3(6,c1)=(J0-I2(i+1,j-1));
        I3(7,c1)=(J0-I2(i+1,j));
        I3(8,c1)=(J0-I2(i+1,j+1));

        %Outer 
        I31(1,c1)=(J0-I2(i,j+2));
        I31(2,c1)=(J0-I2(i-2,j+2));
        I31(3,c1)=(J0-I2(i-2,j));
        I31(4,c1)=(J0-I2(i-2,j-2));
        I31(5,c1)=(J0-I2(i,j-2)); 
        I31(6,c1)=(J0-I2(i+2,j-2));
        I31(7,c1)=(J0-I2(i+2,j));
        I31(8,c1)=(J0-I2(i+2,j+2));
        
        %Edges
        I32(1,c1)=(J0-I2(i-1,j-2));
        I32(2,c1)=(J0-I2(i+1,j-2));
        I32(3,c1)=(J0-I2(i+2,j-1));
        I32(4,c1)=(J0-I2(i+2,j+1));
        I32(5,c1)=(J0-I2(i+1,j+2));
        I32(6,c1)=(J0-I2(i-1,j+2));
        I32(7,c1)=(J0-I2(i-2,j+1));
        I32(8,c1)=(J0-I2(i-2,j-1));
        
              c1=c1+1;
        end 
    end
  
        for i=1:41209
            for j=1:7
                if J0>=I3(j,i)
                   I4(j,i)=1;
                else
                   I4(j,i)=0;
                end
            end
        end
    
        for i=1:41209
            BPIE1(1,i)=I3(1,i)*1+I3(2,i)*2+I3(3,i)*4+I3(4,i)*8+I3(5,i)*16+I3(6,i)*32+I3(7,i)*64;
        end
        BP1=reshape(BPIE1,[203,203]);
        figure(3)
        subplot(3,2,1)
        imshow(BP1')
        title("IE1");
    
        for i=1:41209
            for i=1:7
                if J0>=I31(j,i)
                   I41(j,i)=1;
                else
                   I41(j,i)=0;
                end
            end
        end
        for i=1:41209
            BPOE1(1,i)=I31(1,i)*1+I31(2,i)*2+I31(3,i)*4+I31(4,i)*8+I31(5,i)*16+I31(6,i)*32+I31(7,i)*64;
        end
        BP2=reshape(BPOE1,[203,203]);
        figure(3)
        subplot(3,2,2)
        imshow(BP2')
        title("OE1");
        for i=1:41209
           for i=1:7
               if J0>=I32(j,i)
                  I42(j,i)=1;
               else
                  I42(j,i)=0;
               end
           end
        end
        for i=1:41209
            BPOE2(1,i)=I32(1,i)*1+I32(2,i)*2+I32(3,i)*4+I32(4,i)*8+I32(5,i)*16+I32(6,i)*32+I32(7,i)*64;
        end
        BP3=reshape(BPOE2,[203,203]);
        figure(3)
        subplot(3,2,3)
        imshow(BP3')
        title("OE2");
     for i=1:41209
            for j=1:7
                if J0>=I3(j,i)
                   I43(j,i)=0;
             
                else
                   I43(j,i)=1;
                end
            end
        end
     %disp(I43);
     for i=1:41209
          BPIE2(1,i)=I3(1,i)*1+I3(2,i)*2+I3(3,i)*3+I3(4,i)*4+I3(5,i)*5+I3(6,i)*6+I3(7,i)*7;
     end
     BP4=reshape(BPIE2,[203,203]);
     figure(3)
     subplot(3,2,4)
     imshow(BP4')
     title("IE2");
     
     for i=1:41209
            for j=1:7
                if J0>=I31(j,i)
                   I43(j,i)=0;
                else
                   I43(j,i)=1;
               
                end
            end
       end
     for i=1:41209
          BPOE3(1,i)=I31(1,i)*1+I31(2,i)*2+I31(3,i)*3+I31(4,i)*4+I31(5,i)*5+I31(6,i)*6+I31(7,i)*7;
     end
     BP4=reshape(BPOE3,[203,203]);
     figure(3)
     subplot(3,2,5)
     imshow(BP4')
     title("OE3");
     for i=1:41209
            for j=1:7
                if J0>=I32(j,i)
                   I44(j,i)=0;
                else
                   I44(j,i)=1;
                end
            end
       end
     for i=1:41209
          BPOE4(1,i)=I32(1,i)*1+I32(2,i)*2+I32(3,i)*3+I32(4,i)*4+I32(5,i)*5+I32(6,i)*6+I32(7,i)*7;
     end
     BP4=reshape(BPOE4,[203,203]);
     figure(3)
     subplot(3,2,6)
     imshow(BP4')
     title("OE4");
h1=hist(BPIE1,128);
h2=hist(BPOE1,128);
h3=hist(BPOE2,128);
h4=hist(BPIE2,128);
h5=hist(BPOE3,128);
h6=hist(BPOE4,128);
fist1=[h1(:);h2(:);h3(:);h4(:);h5(:);h6(:)];
fhist(:,clk)=fist1;
clk=clk+1;
% Display the fhist feature vector matrix
%disp('Feature vector matrix (fhist):');
%disp(fhist);


% Concatenating all columns of fhist into a single vector
combined_histogram = fhist(:);

% Plotting the combined histogram
figure(4);
histogram(combined_histogram, 128); % You can adjust the number of bins (128 in this case)
title('Combined Histogram of fhist');
xlabel('Bins');
ylabel('Frequency');

end
%
%