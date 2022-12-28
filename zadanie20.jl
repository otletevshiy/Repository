using HorizonSideRobots
function move_next!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
    else
        move!(robot, right(side))
        move_next!(robot, side)
        move!(robot, left(side))
    end
end

right(side::HorizonSide) = HorizonSide((Int(side) +1)% 4)
left(side::HorizonSide) = HorizonSide((Int(side) +3)% 4)