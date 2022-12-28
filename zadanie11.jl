function draw_chess_square!(robot, n)
    staggered_order = 0
    side = Ost
    for _i in 1:n
        for _j in 1:n-1
            if(staggered_order % 2 == 0)
                putmarker!(robot)
            end
            move!(robot, side)
            staggered_order += 1
        end
        if(staggered_order % 2 == 0)
            putmarker!(robot)
        end
        move!(robot, Nord)
        staggered_order += 1
        side = inverse(side)
    end

    while !isborder(robot, Sud)
        move!(robot, Sud)
    end
    while !isborder(robot, West)
        move!(robot, West)
    end
end

inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)