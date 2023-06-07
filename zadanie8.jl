function find_marker!(robot)    #Функция находит маркер на поле для робота, а переменная k определяет какое количество строк и столбцов робот должен пройти перед обнаружением маркера
    k=0
    side=Nord
    while (!ismarker(robot))
      for _i in 1:2
        along!(side,k,robot)
        side=right(side)
      end
      k+=1
    end
  end
   
  function along!(side,num_steps,robot)   #Функция перемещает робота наnum_steps шагов в направлении заданной переменной side
    for _i in 1:num_steps
      if (!ismarker(robot))
        move!(robot,side)
      end
    end
  end
  
  
  function solve!(robot)  #Функция вызывает функцуию find_marker!
  find_marker!(robot)
  end
  
  right(side::HorizonSide)::HorizonSide = HorizonSide(mod(Int(side)+3, 4))  #Функция меняет сторону на сторону справа по часовой стрелке
