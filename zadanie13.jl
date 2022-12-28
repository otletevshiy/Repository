using HorizonSideRobots
function count_partitions(robot)
    side = Ost
    count = 0
    count_check = 0
    count_blank = 0
    count_total = 0
    while !isborder(robot, side)
        move!(robot, side)
        if isborder(robot, Nord)
            count_blank = 0
            count += 1;
            count_check += 1
        elseif !isborder(robot, Nord) 
            count_blank += 1
            if (count_blank <= 1) 
                count += 1;
                count_check += 1
            else
                if (count == 0 || count_check == 0)
                    count_total += 0
                else 
                    count_total += count / count_check
                    count = 0
                    count_check = 0
                end
            end
        end
        if isborder(robot, side) && !isborder(robot, Nord)
            if (count_blank <= 1)
                if (count == 0 || count_check == 0)
                    count_total += 0
                else 
                    count_total += count / count_check
                    count = 0
                    count_check = 0
                end
            end
            move!(robot, Nord)
            side = inverse(side)
            count = 0
            count_check = 0
        end
    end
    return count_total
end

inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)