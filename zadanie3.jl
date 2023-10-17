using HorizonSideRobots
r=Robot(15,15; animate=true)
function full!(robot) #Фунция полностью закрашивает поле
    corner!(robot)
    putmarker!(robot)
    side = Ost;
    while !isborder(robot, side)
        move!(robot, side)
        putmarker!(robot)
        if isborder(robot, side) && !isborder(robot, Nord)
            move!(robot, Nord)
            putmarker!(robot)
            side = inverse(side)
        end
    end
end

function corner!(robot) #Перемещает робота в левый нижний угол
    while !isborder(robot, Sud)
        move!(robot, Sud)
    end
    while !isborder(robot, West)
        move!(robot, West)
    end
end

inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4) #Функция возвращает противоположную горизонтальную сторону относительно указанной стороны
full!(r)
corner!(r)
