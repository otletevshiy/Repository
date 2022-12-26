function find_marker!(robot)
    num_step=1
    side=Nord
    while !ismarker(robot)
        for _i in 1:2   
            marker_is_find!(robot ,side, num_step)
            side=next(side)
        end
        num_step=num_step+1
    end
end

function marker_is_find!(robot, side, num_step)  
    for _i in 1:num_step   
        if !ismarker(r)
            move!(robot,side)
        else
            break
        end 
    end
end
next(side::HorizonSide) = HorizonSide((Int(side) +1)% 4)