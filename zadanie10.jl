function staggered_order_marker!(robot)
    imax, jmax = r.situation.frame_size
    num_Sud, num_West = to_corner!(robot)
    if (num_Sud + num_West) % 2 == 0
        staggered_order = 0
    else
        staggered_order = 1
    end
    side = Ost
    while !isborder(robot, side)
        if(staggered_order % 2 == 0)
            putmarker!(robot)
        end
        move!(robot, side)
        staggered_order += 1
        if(isborder(robot, side) && !isborder(robot, Nord))
            if(staggered_order % 2 == 0)
                putmarker!(robot)
            end
            move!(robot, Nord)
            staggered_order += 1
            if(staggered_order % 2 == 0)
                putmarker!(robot)
            end
            side = inverse(side)
        end
    end
    putmarker!(robot)
    if jmax % 2 == 0
        num_West = jmax - 1 - num_West
        side_back = West
    else
        side_back = Ost
    end
    num_Sud = imax - 1 - num_Sud
    along!(robot, num_Sud, num_West, side_back)
end

function to_corner!(robot)
    num_West = 0
    num_Sud = 0
    while !isborder(robot, Sud)
        move!(robot, Sud)
        num_Sud += 1
    end
    while !isborder(robot, West)
        move!(robot, West)
        num_West += 1
    end
    return num_Sud, num_West
end

function along!(robot, num_Sud, num_Ost, side_back)
    for _i in 1:num_Sud
        move!(robot, Sud)
    end
    for _i in 1:num_Ost
        move!(robot,side_back)
    end
end

inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)