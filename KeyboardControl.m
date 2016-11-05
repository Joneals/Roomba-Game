function KeyboardControl(r)
global rb
rb = r;
figure('KeyPressFcn', @KPCallback, 'KeyReleaseFcn', @KRCallback)
offsets = [0 0]
vel = 0;
lastvel = 0;
    function KPCallback(hObject, eventdata, cb)
       %global rb
       if (strcmp(eventdata.Key, 'uparrow'))
           vel = .3;
           lastvel = vel;
       
       elseif (strcmp(eventdata.Key, 'downarrow'))
           vel = -.3;
           lastvel = vel;
       elseif (strcmp(eventdata.Key, 'leftarrow'))
           offsets(1) = lastvel.*2;
           offsets(2) = 0;
       
       elseif (strcmp(eventdata.Key, 'rightarrow'))
           offsets(2) = lastvel.*2;
           offsets(1) = 0;
       end
       rb.setDriveVelocity(vel + offsets(1), vel + offsets(2));
    end

    function KRCallback(hObject, eventdata, cb)
       if (strcmp(eventdata.Key, 'uparrow'))
           vel = 0;
       
       elseif (strcmp(eventdata.Key, 'downarrow'))
           vel = 0;
 
       elseif (strcmp(eventdata.Key, 'leftarrow'))
           offsets(1) = 0;
       
       elseif (strcmp(eventdata.Key, 'rightarrow'))
           offsets(2) = 0;
       end
       rb.setDriveVelocity(vel + offsets(1), vel + offsets(2));
    
    end
end
       
    
