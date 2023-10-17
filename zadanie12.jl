using HorizonSideRobots
function count_partitions(robot)   #Функция...
    side = Ost
    count = 0
    count_check = 0
    count_total = 0
    while !isborder(robot, side)
        move!(robot, side)
        if isborder(robot, Nord)
            count += 1;
            count_check += 1
        else 
            if count == 0 || count_check == 0
                count_total += 0
            else 
                count_total += count / count_check
                count = 0
                count_check = 0
            end
        end
        if isborder(robot, side) && !isborder(robot, Nord)
            move!(robot, Nord)
            side = inverse(side)
            count = 0
            count_check = 0
        end
    end
    return count_total
end

inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)   #Функция меняет направление на противоположное
