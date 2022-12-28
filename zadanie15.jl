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
function along!(robot,side,n_steps)
    for _ in 1:n_steps
        move!(robot,side)
    end
end
inverse(side::HorizonSide)::HorizonSide = HorizonSide(mod(Int(side) + 2 , 4)) 
right(side::HorizonSide)::HorizonSide = HorizonSide(mod(Int(side) + 3 , 4)) 