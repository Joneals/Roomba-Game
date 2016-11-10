% Runs the game... pretty self descriptive
% Created by Jacob Reynolds, Hayden Sutton, Matt Trotsky
% jreyno51 , hsutton5 , mtrotsky
% Usage : Pass roomba object r to function, click figure window, and use
% arrow keys to navigate
% Inputs : r - roomba object
% Outputs : none

function main(r)
    web(r.cameraURL);
    KeyboardControl(r);
    mainLoop(r);
end

function mainLoop(r)
    running = 1;
    cliffed = 0;
    bumped = 0;
    lastbump = 0;
    while running;
        cliff = r.getCliffSensors();
        bump = r.getBumpers();
        lightbump = r.getLightBumpers();
        
        if (cliff.left < 100 || cliff.right < 100 || cliff.leftFront < 100 || cliff.rightFront < 100)
           running = 0;
           cliffed = 1;
        end
        
        if ((bump.right || bump.left || bump.front) && ~lastbump )
           
           bumped = bumped + 1; 
           disp (['You just got your bump number ' num2str(bumped)])
           if(bumped > 2)
               running = 0
           end
        end
        lastbump = (bump.right || bump.left || bump.front);
    end
    
    if cliffed
       disp('You fell off a cliff'); 
       close(gcf);
    end
    
    if bumped > 2
       disp('You got bumped') 
       close(gcf);
    end
end