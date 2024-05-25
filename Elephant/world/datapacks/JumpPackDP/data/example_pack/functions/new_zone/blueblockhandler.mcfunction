## Turn ON

# Sarts Small To Big Tranasction
execute if score blueBlockBool blueBlock matches 0 run scoreboard players set redbluetrans redblueTrans 1
execute if score redbluetrans redblueTrans matches 1 run fill 488 119 10 436 91 -4 minecraft:air replace minecraft:blue_terracotta
execute if score redbluetrans redblueTrans matches 1 run clone 436 83 -4 488 55 10 436 91 -4 filtered minecraft:blue_terracotta
execute if score redbluetrans redblueTrans matches 1 run scoreboard players set blueBlockBool blueBlock 1

#Starts Big To Small Transaction
execute if score blueBlockBool blueBlock matches 1 if score redbluetrans redblueTrans matches 0 run scoreboard players set redbluetrans redblueTrans 2
execute if score redbluetrans redblueTrans matches 2 run fill 488 119 10 436 91 -4 minecraft:air replace minecraft:blue_terracotta
execute if score redbluetrans redblueTrans matches 2 run clone 436 52 -4 488 24 10 436 91 -4 filtered minecraft:blue_terracotta
execute if score redbluetrans redblueTrans matches 2 run scoreboard players set blueBlockBool blueBlock 0

# Resets transaction
playsound minecraft:block.stone.place player @a ~ ~ ~
scoreboard players set redbluetrans redblueTrans 0