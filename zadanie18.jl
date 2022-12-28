using HorizonSideRobots
function move_recursive!(robot::Robot, side::HorizonSide)
    if !isborder(robot, side)
        move!(robot, side)
        move_recursive!(robot, side)
    end
end