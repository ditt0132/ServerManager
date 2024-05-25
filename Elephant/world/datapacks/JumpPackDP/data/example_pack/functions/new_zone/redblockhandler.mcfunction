## Turn ON

# Sarts Small To Big Tranasction (0 -> 1) (RED)
execute if score redBlockBool redBlock matches 0 run scoreboard players set redbluetrans redblueTrans 1
execute if score redbluetrans redblueTrans matches 1 run fill 488 119 10 436 91 -4 minecraft:air replace minecraft:red_terracotta
execute if score redbluetrans redblueTrans matches 1 run clone 436 127 -4 488 155 10 436 91 -4 filtered minecraft:red_terracotta
execute if score redbluetrans redblueTrans matches 1 run scoreboard players set redBlockBool redBlock 1

#Starts Big To Small Transaction
execute if score redBlockBool redBlock matches 1 if score redbluetrans redblueTrans matches 0 run scoreboard players set redbluetrans redblueTrans 2
execute if score redbluetrans redblueTrans matches 2 run fill 488 119 10 436 91 -4 minecraft:air replace minecraft:red_terracotta
execute if score redbluetrans redblueTrans matches 2 run clone 436 158 -4 488 186 10 436 91 -4 filtered minecraft:red_terracotta
execute if score redbluetrans redblueTrans matches 2 run scoreboard players set redBlockBool redBlock 0

# Resets transaction

scoreboard players set redbluetrans redblueTrans 0