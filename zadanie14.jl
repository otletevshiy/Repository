using HorizonSideRobots

function try_move!(robot, side)   #Функция возвращает значение false, если робот стоит на границе, в противном случае робот перемещается в заданном направлении
    if isborder(robot, side)
        return false
        move!(robot, side)
    end
end

function along!(robot, side)    #Функия вызывает функцию try_move! до тех пор она не вернет значение false
    while try_move!(robot, side) 
    end
end

function snake!(robot, side)   #Функция пытается двигаться в заданном направлении, если не получается меняет его на противоположное
    along!(robot, side)
    while try_move!(robot, side)
        side = inverse(side)
        along!(robot, side)
    end
end

inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)   #Функция меняет направление на противоположное
