function find_window_major!(robot,side)
    if isborder(robot,right(side))
        find_window!(()->isborder(robot,right(side)),robot,side)
    elseif isborder(robot,left(side))
        find_window!(()->isborder(robot,left(side)),robot,side)
    end
end
function find_window!(stop_condition::Function,robot,side)
    n = 0
    while stop_condition()
        n+=1
        along!(robot,side,n)
        side = inverse(side)
    end
end
function along!(robot,side,n_steps) #Эта функция перемещает робота вдоль стороны side на указанное количество шагов n_steps
    for _ in 1:n_steps
        move!(robot,side)
    end
end

inverse(side::HorizonSide)::HorizonSide = HorizonSide(mod(Int(side) + 2 , 4)) #Эта функция возвращает противоположное направление горизонтальной стороны
right(side::HorizonSide)::HorizonSide = HorizonSide(mod(Int(side) + 3 , 4)) #Функция меняет сторону на сторону справа по часовой стрелке
left(side::HorizonSide)::HorizonSide = HorizonSide(mod(Int(side) + 1 , 4)) #Функция меняет сторону на сторону слева по часовой стрелке
