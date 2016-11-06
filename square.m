% Square.m
% Makes the robot travel in a square
% Created by : 
% Hayden Sutton - hsutton5
% Jacob Reynolds - jreyno51
% Matt Trotsky - mtrotsky
function square(r)

    for i=1:4
        r.moveDistance(.5, .5);
        r.turnAngle(90, .5); 
    end