using HorizonSideRobots
function move_recursive_putmarker!(robot::Robot, side::HorizonSide)  #Функция определяет находится ли она у границы в заданном направлении, если да, то ставит маркер, если нет то двигается в заданном направлении, после чего вызываетсебя, если робот прошел после всю границу в одном направлении, он перемещается в обратнм направлении
    if isborder(robot, side)
        putmarker!(robot)
    else
        move!(robot, side)
        move_recursive_putmarker!(robot, side)
        move!(robot, inverse(side))
    end
end

inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)  #Функция меняет направление на противоположное
