% Starts the race!
% Created by Jacob Reynolds, Hayden Sutton, Matt Trotsky
% jreyno51 , hsutton5 , mtrotsky
% Usage : Pass roomba object r to function, use controller to navigate
% 
% Inputs : r - roomba object
% Outputs : none


function startRace(r)
    web(r.cameraURL);
    %%KeyboardControl(r);
    mainLoop(r);
end

function mainLoop(r)
tic
joy = vrjoystick(1);
r.setLEDCenterColor(255);
r.setLEDDigits('');
load('record')
while 1
    
    ax = axis(joy); % Get the axis values
    ax = ax .* (abs(ax) > .1); % Fancy logic to threshold values
    vel = -ax(2)./2; % Left stick vertical
    turn = -2.*vel/(ax(4).*4); % Right stick horizontal
    turn
    r.setDriveVelocityRadius(vel, turn);
    pause(.1);
    sensors = r.getAllSensors();
    cliffs = sensors.cliff;
    bumpers = sensors.bumpers;
    lightbumpers = sensors.lightBumper;
    
    if (bumpers.left || bumpers.right || bumpers.front)
       r.moveDistance(-.05,.5) 
       pause(.3);
    end
    
    if (lightbumpers.left > 100 || lightbumpers.right > 100 || lightbumpers.leftFront > 100 || lightbumpers.rightFront > 100)
       r.beep;
    end
    
    if (cliffs.leftFront > 2500 || cliffs.rightFront > 2500 || cliffs.left > 2500 || cliffs.right > 2500)
       r.setLEDCenterColor(0)
       finishtime = toc
       disp(['You finished the race in ' num2str(finishtime) ' seconds'] ); 
       close(gcf);
       r.setLEDDigits('yay');
       r.stop();
       if (finishtime < record)
          disp('You set a new record!')
          record = finishtime
          save('record','record');
       end
       
       break;
    end
    
    
end
end
