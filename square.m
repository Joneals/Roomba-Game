% Square.m
% Makes the robot travel in a square
% Created by : 
% Hayden Sutton - hsutton5
% Jacob Reynolds - jreyno51
% Matt Trotsky - mtrotsky
r = roomba(34);

for i=1:3
   r.moveDistance(.5);
   r.turnAngle(90); 
end