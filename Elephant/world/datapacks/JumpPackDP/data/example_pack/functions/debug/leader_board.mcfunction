## ScoreBoard

# Logic

execute if score CurrentTime CurrentTimerBool matches 1 run scoreboard players add CurrentTime Ticker 1
execute if score CurrentTime Ticker matches 20 if score CurrentTime CurrentTimerBool matches 1 run scoreboard players add CurrentTime CurrentTimer 1

# Cleanup
execute if score CurrentTime Ticker matches 20 if score CurrentTime CurrentTimerBool matches 1 run scoreboard players set CurrentTime Ticker 0


### Docs
## Start
# scoreboard players set CurrentTime CurrentTimerBool 1
## End
# scoreboard players set CurrentTime CurrentTimerBool 0