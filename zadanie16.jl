function spiral!(stop_condition::Function,robot) #Функция двигает робота в спиральном образе вокруг начальной точки. Робот сначала двигается на одну клетку в направлении севера, затем поворачивается на 90 градусов вправо и двигается на две клетки, затем снова поворачивается и двигается на три клетки, и так далее, увеличивая количество шагов на каждой итерации. Функция продолжает двигаться в спиральном образе, пока условие stop_condition не вернет true.
    a = true
    num_steps = 1
    check_steps = 0
    side = Nord
    while a
        side = right(side)
        for _ in 1:num_steps
            move!(robot,side)
            if stop_condition()
                a = false
                return
            end
        end
        check_steps += 1
        if check_steps % 2 == 0
            num_steps += 1
        end
    end
end

right(side::HorizonSide)::HorizonSide = HorizonSide(mod(Int(side) + 3 , 4)) #Функция меняет сторону на сторону справа по часовой стрелке
