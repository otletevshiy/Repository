using HorizonSideRobots
r=Robot(15,15; animate=true)
function perimeter!(robot)  #Перемещает робота по периметру, попутня ставя маркеры на каждой стороне
    for side in (Ost, Nord, West, Sud)
        while !isborder(robot, side)
            move!(robot, side)
            putmarker!(robot)
        end
    end
end
perimeter!(r)
