patches-own [live-neighbors] ;; agent variable: each patch can have a different value for live-neigbors

to setup 
  clear-all
  ask patches [
    set pcolor red - 3
    if random 100 < 15 ;; draw a number at random from 0 to 100 and select those which are less than 15
    [set pcolor green]
    ]
  reset-ticks
end

to go
  ask patches [
    set live-neighbors count neighbors with [pcolor = green] ;; ask to count neighbors
    ]
  ask patches [
    if live-neighbors = 3 [set pcolor green]
    if (live-neighbors = 0) or (live-neighbors = 1) [set pcolor red - 3]
    if live-neighbors >= 4 [set pcolor red - 3]
    ]
  tick
end

