## Initialize


scoreboard objectives add CurrentTimer dummy "Times:"
scoreboard objectives add CurrentTimerBool dummy
scoreboard objectives add Ticker dummy

# Init
scoreboard players set CurrentTime CurrentTimer 0
scoreboard players set CurrentTime Ticker 0
scoreboard players set CurrentTime CurrentTimerBool 0
scoreboard players set CreatorsHighscore CurrentTimer 515

