function rollin(robot,side) #Эта функция рекурсивно двигает робота в направлении, указанном параметром side.Если робот не сталкивается с границей, он двигается вперед, вызывает rollin рекурсивно для того же направления, а затем снова двигается вперед. Если робот сталкивается с границей, он вызывает функцию step!
    if !isborder(robot,side)
        move!(robot,side)
        rollin(robot,side)
        move!(robot,side)
    else
        step!(robot,side)
    end
end

function step!(robot,side) #В этой функции если робот не сталкивается с границей, он двигается вперед. Если робот сталкивается с границей, он сначала поворачивается направо, затем вызывает step! рекурсивно для того же направления, и, наконец, поворачивается налево
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
