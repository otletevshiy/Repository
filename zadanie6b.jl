function drip(robot)
    back_path = move_to_angle!(robot)
    four_markers!(robot)
    move!(robot::CoordRobot,back_path::Vector{NamedTuple{(:side, :num_steps), Tuple{HorizonSide,Int}}})
    
end
function move_to_angle!(robot, angle=(Sud,West)) 
    back_path = NamedTuple{(:side, :num_steps), Tuple{HorizonSide,Int}}[] 
    while !isborder(robot,angle[1]) || !isborder(robot, angle[2])
        push!(back_path, (side = inverse(angle[1]), num_steps = numsteps_along!(robot, angle[1])))
        push!(back_path, (side = inverse(angle[2]), num_steps = numsteps_along!(robot, angle[2])))  
    end
    return back_path
end
function HorizonSideRobots.move!(robot::CoordRobot, back_path::Vector{NamedTuple{(:side, :num_steps), Tuple{HorizonSide,Int}}})
    for next in back_path
        along!(robot, next.side, next.num_steps)
    end
end
function four_markers!(robot)
    for side in (Ost,Nord,West,Sud)
        while !isborder(robot,side)
            move!(robot,side)
            if check_coord(robot)
                putmarker!(robot)
            end
        end
    end
end

function check_coord(robot)
    x,y = get_coord(robot)
    if x == 0 || y == 0 
        return true
    else
        return false
    end
end
function along_putm!(robot,side)
    while !isborder(robot,side)
        move!(robot,side)
        putmarker!(robot)
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
function along!(robot,side,n)
    for _ in 1:n
        move!(robot,side)
    end
end
inverse(side::HorizonSide)::HorizonSide = HorizonSide(mod(Int(side)+2, 4))
