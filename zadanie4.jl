using HorizonSideRobots
r=Robot(15,15; animate=true)
function cross_move(robot, side_x, side_y)     #Функция перемещает робота по кресту начиная с текущего положения, если робот достиг границы поля, то направление меняется на противоположное, и движется покуда не достигнет начальной позиции
    num_step = 0  
    while !isborder(robot, side_x) && !isborder(robot, side_y)
        move!(robot, side_x)
        move!(robot, side_y)
        putmarker!(robot)
        num_step += 1
    end 

    if side_x == Nord
        side_x = Sud
    else
        side_x = Nord
    end

    if side_y == Ost
        side_y = West
    else
        side_y = Ost
    end


    for _ in 1:num_step
        move!(robot, side_x)
        move!(robot, side_y)
    end
end

function plus!(robot)   #Функция перемещает робота в форме плюса ставя маркер по центру
    for side_x in (Nord, Sud)
        for side_y in (Ost, West)
            cross_move(robot, side_x, side_y)
        end
    end
    putmarker!(robot)
end
plus!(r)
