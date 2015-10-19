turtles-own [friend enemy]

to setup
  clear-all
  ask patches [set pcolor white]
  create-turtles number [
    setxy random-xcor random-ycor
    
    ;; set turtle personalities based on chooser
    if (personalities = "brave")  [set color blue]
    if (personalities = "coward") [set color red]
    if (personalities = "mixed")  [set color one-of [blue red]]
    
    ; choose friend and enemy targets
    set friend one-of other turtles
    set enemy one-of other turtles
  ]
  reset-ticks
end

to go 
  ask turtles [
    if (color = blue) [act-bravely]
    if (color = red)  [act-cowardly]
    ]
  tick
end

to act-bravely
  
  ;; move forward to the midpoint of your friend and enemy
  facexy ([xcor] of friend + [xcor] of enemy) / 2
         ([ycor] of friend + [ycor] of enemy) / 2
         fd 0.1
end


to act-cowardly
  
  ;; put your friend between you and your enemy
  facexy [xcor] of friend + ([xcor] of friend - [xcor] of enemy) / 2
         [ycor] of friend + ([ycor] of friend - [ycor] of enemy) / 2
         fd 0.1
end
