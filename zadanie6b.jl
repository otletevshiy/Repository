function drip(robot) #Эта функция вызывает move_to_angle! для сохранения пути назад, затем вызывает four_markers! для постановки четырех маркеров на границе координатной сетки и, наконец, возвращает робота к начальной позиции с помощью сохраненного пути.
    back_path = move_to_angle!(robot)
    four_markers!(robot)
    move!(robot::CoordRobot,back_path::Vector{NamedTuple{(:side, :num_steps), Tuple{HorizonSide,Int}}})
    
end
function move_to_angle!(robot, angle=(Sud,West)) #Эта функция двигает робота вперед вдоль заданных направлений angle и сохраняет каждый шаг (направление и количество шагов) в структуре NamedTuple. Робот продолжает двигаться, пока не столкнется с границей в обоих направлениях. Возвращает сохраненный путь.
    back_path = NamedTuple{(:side, :num_steps), Tuple{HorizonSide,Int}}[] 
    while !isborder(robot,angle[1]) || !isborder(robot, angle[2])
        push!(back_path, (side = inverse(angle[1]), num_steps = numsteps_along!(robot, angle[1])))
        push!(back_path, (side = inverse(angle[2]), num_steps = numsteps_along!(robot, angle[2])))  
    end
    return back_path
end
function HorizonSideRobots.move!(robot::CoordRobot, back_path::Vector{NamedTuple{(:side, :num_steps), Tuple{HorizonSide,Int}}}) #Эта функция перемещает робота по заданному пути, который представляет собой вектор из NamedTuple, содержащих направления и количество шагов. Робот двигается вперед по пути, начиная с первого элемента в векторе.
    for next in back_path
        along!(robot, next.side, next.num_steps)
    end
end 
function four_markers!(robot) #Эта функция двигает робота вдоль каждой из четырех сторон до тех пор, пока он не столкнется с границей. Если робот находится на координатах x=0 или y=0, ставит маркер.
    for side in (Ost,Nord,West,Sud)
        while !isborder(robot,side)
            move!(robot,side)
            if check_coord(robot)
                putmarker!(robot)
            end
        end
    end
end

function check_coord(robot) # Эта функция проверяет координаты робота. Если x=0 или y=0, возвращает true, в противном случае возвращает false.
    x,y = get_coord(robot)
    if x == 0 || y == 0 
        return true
    else
        return false
    end
end 
function along_putm!(robot,side) #: Эта функция двигает робота вдоль заданного направления и ставит маркеры на каждом шаге, пока не столкнется с границей.
    while !isborder(robot,side)
        move!(robot,side)
        putmarker!(robot)
    end
end
function numsteps_along!(robot,side) #
    n_steps = 0
    while !isborder(robot,side)
        move!(robot,side) 
        n_steps+=1       
    end
    return n_steps
end
function along!(robot,side,n) #
    for _ in 1:n
        move!(robot,side)
    end
end
inverse(side::HorizonSide)::HorizonSide = HorizonSide(mod(Int(side)+2, 4)) #Меняет направление на противоположное
