% LineFollow
function LineFollow(r)
    v = .1;
    offsets = [0 0];
    thres = 2000;
    while 1
        %pause(.05)
        cliffs = r.getCliffSensors();
        %disp(cliffs)
        if (cliffs.leftFront < thres)
           offsets(1) = 0.2;
           offsets(2) = -0.07;
          % disp('Detected left!')
        
        elseif (cliffs.rightFront < thres)
           offsets(2) = 0.2;
           offsets(1) = -.07;
           % disp('Detected right!')
        
        
%         elseif (cliffs.left < thres)
%             offsets(1) = 0.25;
%            offsets(2) = -.2;
%         
%         elseif (cliffs.right < thres)
%             offsets(2) = 0.25;
%            offsets(1) = -.2;
        
        else
            offsets = [0 0];
        end
        r.setDriveVelocity(v+offsets(1), v+offsets(2));
            
%         
%         if (r.getBumpers.front || r.getBumpers.left || r.getBumpers.right)
%            %r.moveDistance(-.5);
%            %r.turnAngle(90,.5)
%            r.stop();
%            break;
%         end
        
    end
end