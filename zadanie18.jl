using HorizonSideRobots
function move_recursive!(robot::Robot, side::HorizonSide)  #Функция проверяет наличие границы поля и перемещает его в заданном направлении,после чего функция вызывает сама себя
    if !isborder(robot, side)
        move!(robot, side)
        move_recursive!(robot, side)
    end
end
