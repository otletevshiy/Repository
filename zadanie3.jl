using HorizonSideRobots
r=Robot(15,15; animate=true)
function full!(robot)  #Функция полностью закрашивает поле
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
inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)   #Функция меняет сторону на противоположную
full!(r)
