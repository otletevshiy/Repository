using HorizonSideRobots
r=Robot(15,15; animate=true)
function mark_kross(robot) 
    for side in (HorizonSide(i) for i=0:3)
        putmarkers!(r,side)
        move_by_markers(r,inverse(side))
    end
    putmarker!(r)
end
putmarkers!(robot,side::HorizonSide) = 
while isborder(r,side)==false 
    move!(r,side)
    putmarker!(r)
end
move_by_markers(robot,side::HorizonSide) = 
while ismarker(r)==true 
    move!(r,side) 
end 
inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4)) 
function gocentre(robot)
    for i in (1:7)
    move!(r,HorizonSide(3))
    move!(r,HorizonSide(0))
    end
end
gocentre(r)
mark_kross(r)
