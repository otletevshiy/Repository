function double_dist!(robot,side)
    if !isborder(robot,side)
        move!(robot,side)
        double_dist!(robot,side)
        for _ in 1:2
            if !isborder(robot,inverse(side))
                move!(robot,inverse(side))
            end
        end
    end
end
inverse(side::HorizonSide)::HorizonSide = HorizonSide(mod(Int(side) + 2, 4)
