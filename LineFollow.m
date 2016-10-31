% LineFollow
function LineFollow(r)
    v = .1;
    offsets = [0 0];
    thres = 2000;
    while 1
        pause(.05)
        cliffs = r.getCliffSensors();
        %disp(cliffs)
        if (cliffs.leftFront < thres)
           offsets(1) = 0.25;
           offsets(2) = 0;
           disp('Detected left!')
        
        elseif (cliffs.rightFront < thres)
           offsets(2) = 0.25;
           offsets(1) = 0;
           disp('Detected right!')
        
        
%         elseif (cliffs.left < thres)
%             offsets(1) = 0.25;
%            offsets(2) = 0;
%         
%         elseif (cliffs.right < thres)
%             offsets(2) = 0.25;
%            offsets(1) = 0;
        
        else
            offsets = [0 0];
        end
        r.setDriveVelocity(v+offsets(1), v+offsets(2));
            
        
        if (r.getBumpers.front)
           r.stop();
           break;
        end
        
    end
end