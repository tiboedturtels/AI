function [ D_revised, revised ] = CS4300_Revise( D, arc, P )

D_revised = D;
for x = 1:3
    satisfied = false;
    for y = 1:3
        if(feval(P, i, D_revised(arc(1)), j, D_revised(arc(2))))
            satisfied = true;
            break;
        end
    end
    if(satisfied == false)
        D_revised(x) = 0;
        revised = true;
    end
end
return

