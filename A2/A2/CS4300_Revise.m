function [ D_revised, revised ] = CS4300_Revise( D, arc, P )

D_revised = D;
revised = 0;
domain_x = D_revised(arc.x,:);
for x = 1:size(domain_x,2)
    if(domain_x(x) == 0)
        continue;
    end
    satisfied = false;
    domain_y = D_revised(arc.y,:);
    for y = 1:size(domain_y,2)
        if(domain_y(y) == 0)
            continue;
        elseif(feval(P, arc.x, x, arc.y, y))
            satisfied = true;
            break;
        end
    end
    if(satisfied == false)
        domain_x(x) = 0;
        D_revised(arc.x,:) = domain_x;
        revised = true;
    end
end
return

