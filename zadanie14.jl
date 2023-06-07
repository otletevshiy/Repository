using HorizonSideRobots

function try_move!(robot, side)
    if isborder(robot, side)
        return false
        move!(robot, side)
    end
end

function along!(robot, side)
    while try_move!(robot, side) 
    end
end

function snake!(robot, side)
    along!(robot, side)
    while try_move!(robot, side)
        side = inverse(side)
        along!(robot, side)
    end
end

inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)
