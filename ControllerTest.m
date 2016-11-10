joy = vrjoystick(1); % Initialize Joystick object

while 1
    ax = axis(joy); % Get the axis values
    ax = ax .* (abs(ax) > .1) % Fancy logic to threshold values
    vel = -ax(2)./2; % Left stick vertical
    turn = -ax(4)./2; % Right stick horizontal
    r.setDriveVelocityRadius(vel, turn);
    pause(.1);
    
end