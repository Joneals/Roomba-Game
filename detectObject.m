function detectObject(cam)
% Initialization

hold on
 i = 0;
    while 1
        
        img = cam.snapshot;
        diff_im = imsubtract(img(:,:,3),rgb2gray(img));
        diff_im = medfilt2(diff_im, [9 9]);
        diff_im = im2bw(diff_im,.2);
        diff_im = bwareaopen(diff_im, 500);
        bw = bwlabel(diff_im, 8);
        imshow(diff_im);
        %stats.BoundingBox = [0 0 0 0];
        
        stats = regionprops(diff_im, 'BoundingBox', 'Centroid');
        hold on
        for obj=1:length(stats)
            %rectangle('Position', stats(1).BoundingBox, 'EdgeColor', 'r', 'LineWidth', 2);
            plot(stats(obj).Centroid(1), stats(obj).Centroid(2), 'r*');
        end
        drawnow
        hold off
        
    end
    %clear cam
end