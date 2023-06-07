using HorizonSideRobots
function move_next!(robot, side)   #Функция проверяет есть ли клетка, раположенная в заданном направлении, если нет то робот перемещается перемещается в заданном направлении. если клетка в направлении является границей поля, то робот сначала перемещается на одну клетку, затем вызывает сама себя, но с противоположной стороной, затем перемещается на одну клетку в указанном направлении
    if !isborder(robot, side)
        move!(robot, side)
    else
        move!(robot, right(side))
        move_next!(robot, side)
        move!(robot, left(side))
    end
end

right(side::HorizonSide) = HorizonSide((Int(side) +3)% 4)   #Функция меняет направление на направление справа по часовой стрелке
left(side::HorizonSide) = HorizonSide((Int(side) +1)% 4)    #Функция меняет направление на направление слева против часовой стрелке
