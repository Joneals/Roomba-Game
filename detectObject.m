function detectObject(cam)
% Initialization

hold on
 i = 0;
    while 1
        img = cam.snapshot;
        imshow(img);
        for i=1:3
            diff_im = imsubtract(img(:,:,i),rgb2gray(img));
            diff_im = medfilt2(diff_im, [8,8]);
            diff_im = im2bw(diff_im, .2);
            diff_im = bwareaopen(diff_im, 1500);
            bw = bwlabel(diff_im, 8);
            stats = regionprops(diff_im, 'BoundingBox', 'Centroid');
            hold on
            for obj=1:length(stats)
                rectangle('Position', stats(obj).BoundingBox, 'EdgeColor', [1*i==1, 1*i==2, 1*i==3], 'LineWidth', 3);
                plot(stats(obj).Centroid(1), stats(obj).Centroid(2),'o', 'MarkerFaceColor',[1*i==1, 1*i==2, 1*i==3] );
            end
        end
        
        drawnow
        hold off
        
    end
    %clear cam
end