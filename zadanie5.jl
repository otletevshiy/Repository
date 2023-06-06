using HorizonSideRobots
r=Robot(15,15; animate=true)
function around!(robot)
   corner!(robot)
end

function corner!(robot)
    while !isborder(robot, Sud)
        move!(robot, Sud)
    end
    while !isborder(robot, West)
        move!(robot, West)
    end
end
