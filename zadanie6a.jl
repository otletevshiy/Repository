function drip(robot::Robot)
    back_path = move_to_angle!(robot::Robot)
    perimeter!(robot::Robot)
    move!(robot::Robot,back_path::Vector{NamedTuple{(:side, :num_steps), Tuple{HorizonSide,Int}}})
    
end
function move_to_angle!(robot, angle=(Sud,West))
    back_path = NamedTuple{(:side, :num_steps), Tuple{HorizonSide,Int}}[] 
    while !isborder(robot,angle[1]) || !isborder(robot, angle[2])
        push!(back_path, (side = inverse(angle[1]), num_steps = numsteps_along!(robot, angle[1])))
        push!(back_path, (side = inverse(angle[2]), num_steps = numsteps_along!(robot, angle[2])))  
    end
    return back_path
end
function HorizonSideRobots.move!(robot, back_path::Vector{NamedTuple{(:side, :num_steps), Tuple{HorizonSide,Int}}})
    back_path = reverse!(back_path)
    for next in back_path
        along!(robot, next.side, next.num_steps)
    end
end
function perimeter!(robot::Robot)
    for side in (Ost,Nord,West,Sud)
        along_putm!(robot::Robot,side)
    end
    
end

function along_putm!(robot::Robot,side)
    while !isborder(robot::Robot,side)
        move!(robot::Robot,side)
        putmarker!(robot::Robot)
    end
end
function numsteps_along!(robot,side)
    n_steps = 0
    while !isborder(robot,side)
        move!(robot,side) 
        n_steps+=1       
    end
    return n_steps
end
function along!(robot::Robot,side,n)
    for _ in 1:n
        move!(robot::Robot,side)
    end
end
inverse(side::HorizonSide)::HorizonSide = HorizonSide(mod(Int(side)+2, 4))  #Функция меняет сторону на противоположную
