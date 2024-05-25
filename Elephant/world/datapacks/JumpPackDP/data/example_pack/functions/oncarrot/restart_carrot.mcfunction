# Setup
scoreboard objectives add carrots minecraft.used:carrot_on_a_stick
scoreboard objectives add timer dummy
# count timer down
scoreboard players remove @a[scores={timer=1..}] timer 1
# reset the timer if the carrot on the stick was used
scoreboard players set @a[scores={carrots=1}] timer 1
# reset the scoreboard that detects if the carrot on the stick was used
scoreboard players set @a carrots 0


