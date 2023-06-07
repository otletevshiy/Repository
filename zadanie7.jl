function iceout!(robot,side)   #Функция перемещает робота на n клеток в направлении side_for_move
    side1 = side
    side_for_move = right(side1)
    n = 0
    while isborder(robot,side1)
        n+=1
        along!(robot,side_for_move,n)
        side_for_move = inverse(side_for_move)
    end
end

function along!(robot,side,n_steps)   #Функция перемещает робота на указанное количество шагов вдоль указанной стороны
    for _ in 1:n_steps
        move!(robot,side)
    end
end


right(side::HorizonSide)::HorizonSide = HorizonSide(mod(Int(side) + 3 , 4))   #Функция меняет сторону на другую сторону которая находится справа по часовой стрелке
inverse(side::HorizonSide)::HorizonSide = HorizonSide(mod(Int(side) + 2 , 4))   #Функция меняет сторону на противоположную
