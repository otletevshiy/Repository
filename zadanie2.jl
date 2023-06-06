using HorizonSideRobots
r=Robot(15,15; animate=true)
function perimeter!(robot)
    for side in (Ost, Nord, West, Sud)
        while !isborder(robot, side)
            move!(robot, side)
            putmarker!(robot)
        end
    end
end
perimeter!(r)
