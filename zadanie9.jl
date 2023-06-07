function find_marker!(robot)    #Функция находит маркер на поле
    num_step=1
    side=Nord
    while !ismarker(robot)
        for _i in 1:2   
            marker_is_find!(robot ,side, num_step)
            side=next(side)
        end
        num_step=num_step+1
    end
end

function marker_is_find!(robot, side, num_step)    #Функция проверяет, есть ли маркер на текущей клетке поля, если маркер есть то функция завершается, если нет то робот продолжает движение
    for _i in 1:num_step   
        if !ismarker(r)
            move!(robot,side)
        else
            break
        end 
    end
end
next(side::HorizonSide) = HorizonSide((Int(side) +1)% 4)   #Функция меняет сторону на следующую против часовой стрелке
