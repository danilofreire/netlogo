turtles-own [wealth]

to setup
  clear-all
  create-turtles 500 [
    set wealth 100
    set shape "circle"
    set color green
    set size 2
    ;; visualise the turtles from left to right in ascending order of wealth
    setxy wealth random-ycor
    ]
  reset-ticks  
end

to go
  ask turtles with [wealth > 0] [transact]
  ask turtles [if wealth <= max-pxcor [set xcor wealth]]
  tick
end

to transact  
  ;; give a dollar to another turtle
  set wealth wealth - 1
  ask one-of other turtles [set wealth wealth + 1]
end
