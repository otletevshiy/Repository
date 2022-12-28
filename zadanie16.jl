function spiral!(stop_condition::Function,robot)
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
right(side::HorizonSide)::HorizonSide = HorizonSide(mod(Int(side) + 3 , 4)) 