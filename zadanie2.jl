using HorizonSideRobots
r=Robot(15,15; animate=true)
function perimeter!(robot)  #Перемещает робота по периметру, попутня ставя маркеры на каждой стороне
    corner!(robot)
    for side in (Ost, Nord, West, Sud)
        while !isborder(robot, side)
            move!(robot, side)
            putmarker!(robot)
        end
    end
end

function corner!(robot)  #Функция перемещает робота в левый нижний угол
    while !isborder(robot, Sud)
        move!(robot, Sud)
    end
    while !isborder(robot, West)
        move!(robot, West)
    end
end
perimeter!(r)
corner!(r)
