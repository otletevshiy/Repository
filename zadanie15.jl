function find_window_major!(robot,side) #Сначала функция проверяет, есть ли граница справа от текущей позиции робота.Если граница справа есть, она вызывает функцию find_window! для поиска окна в этом направлении.Если справа нет границы, она проверяет, есть ли граница слева от текущей позиции робота, используя isborder(robot, left(side)). Если граница слева есть, она также вызывает find_window! для поиска окна в этом направлении.
    if isborder(robot,right(side))
        find_window!(()->isborder(robot,right(side)),robot,side)
    elseif isborder(robot,left(side))
        find_window!(()->isborder(robot,left(side)),robot,side)
    end
end
function find_window!(stop_condition::Function,robot,side) #Функция двигает робота в определенном направлении до тех пор, пока условие stop_condition не возвращает false.Она увеличивает количество шагов при каждом движении и затем возвращает это количество, представляя тем самым расстояние (в шагах), которое робот прошел, прежде чем был остановлен условием stop_condition.
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
