function drip(robot::Robot) # Эта функция сначала вызывает move_to_angle! для того, чтобы робот вернулся к начальному углу. Затем она вызывает perimeter! для перемещения робота вдоль периметра и ставит маркеры на своем пути. После этого робот возвращается по предварительно сохраненному пути, который был создан в move_to_angle!
    perimeter!(robot::Robot)
    move!(robot::Robot,back_path::Vector{NamedTuple{(:side, :num_steps), Tuple{HorizonSide,Int}}})
    
end
function move_to_angle!(robot, angle=(Sud,West)) #Эта функция двигает робота вперед вдоль заданных направлений angle, сохраняя каждый шаг (направление и количество шагов) в структуре NamedTuple. Она продолжает двигаться, пока не столкнется с границей в обоих направлениях. После этого она возвращает сохраненный путь.
    back_path = NamedTuple{(:side, :num_steps), Tuple{HorizonSide,Int}}[] 
    while !isborder(robot,angle[1]) || !isborder(robot, angle[2])
        push!(back_path, (side = inverse(angle[1]), num_steps = numsteps_along!(robot, angle[1])))
        push!(back_path, (side = inverse(angle[2]), num_steps = numsteps_along!(robot, angle[2])))  
    end
    return back_path
end
function HorizonSideRobots.move!(robot, back_path::Vector{NamedTuple{(:side, :num_steps), Tuple{HorizonSide,Int}}}) # Эта функция перемещает робота по заданному пути, который представляет собой вектор из NamedTuple, содержащих направления и количество шагов. Робот двигается в обратном порядке, начиная с последнего элемента в векторе.
    back_path = reverse!(back_path)
    for next in back_path
        along!(robot, next.side, next.num_steps)
    end
end
function perimeter!(robot::Robot) #Эта функция двигает робота вдоль периметра сетки, начиная с каждой из четырех сторон. По мере движения робота она ставит маркеры.
    for side in (Ost,Nord,West,Sud)
        along_putm!(robot::Robot,side)
    end
    
end

function along_putm!(robot::Robot,side) #Эта функция двигает робота вдоль определенного направления и ставит маркеры на каждом шаге, пока не столкнется с границей
    while !isborder(robot::Robot,side)
        move!(robot::Robot,side)
        putmarker!(robot::Robot)
    end
end
function numsteps_along!(robot,side) #Эта функция возвращает количество шагов, которое робот сможет сделать вдоль заданного направления, не сталкиваясь с границей.
    n_steps = 0
    while !isborder(robot,side)
        move!(robot,side) 
        n_steps+=1       
    end
    return n_steps
end
function along!(robot::Robot,side,n) #Эта функция двигает робота вдоль заданного направления на указанное количество шагов.
    for _ in 1:n
        move!(robot::Robot,side)
    end
end
inverse(side::HorizonSide)::HorizonSide = HorizonSide(mod(Int(side)+2, 4))  #Функция меняет сторону на противоположную
