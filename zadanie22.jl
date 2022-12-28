function rollin(robot,side)
    if !isborder(robot,side)
        move!(robot,side)
        rollin(robot,side)
        move!(robot,side)
    else
        step!(robot,side)
    end
end

function step!(robot,side)
    if !isborder(robot,side)
        move!(robot,side)
    else 
        move!(robot,right(side))
        step!(robot,side)
        move!(robot,left(side))
    end
end

right(side::HorizonSide)::HorizonSide = HorizonSide(mod(Int(side) + 3, 4))
left(side::HorizonSide)::HorizonSide = HorizonSide(mod(Int(side) + 1, 4))