using HorizonSideRobots
r=Robot(15,15; animate=true)
function mark_kross(robot)   #Функция на каждом направлении ставит маркеры и перемещает робота в обратном направлении  
    for side in (HorizonSide(i) for i=0:3)
        putmarkers!(r,side)
        move_by_markers(r,inverse(side))
    end
    putmarker!(r)
end
putmarkers!(robot,side::HorizonSide) =     #Пока робот не достигнет границы перемещает его вдоль этой стороны и ставит маркеры
while isborder(r,side)==false 
    move!(r,side)
    putmarker!(r)
end
move_by_markers(robot,side::HorizonSide) =     #Функция перемещает робота вдоль стороны покуда на в клетке с роботом есть маркер
while ismarker(r)==true 
    move!(r,side) 
end 
inverse(side::HorizonSide) = HorizonSide(mod(Int(side)+2, 4))    #Принимает сторону и меняет ее на противоположную
function gocentre(robot)   #Функция перемещает робота в центр
    for i in (1:7)
    move!(r,HorizonSide(3))
    move!(r,HorizonSide(0))
    end
end
gocentre(r)
mark_kross(r)
