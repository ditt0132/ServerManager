# Only if target island is on (will set transaction)
execute if score island4 island4Bool matches 1 run scoreboard players set trans transaction 1
execute if score island4 island4Bool matches 1 if score trans transaction matches 1 run fill 478 94 58 482 96 54 minecraft:white_concrete replace minecraft:honeycomb_block
execute if score island4 island4Bool matches 1 if score trans transaction matches 1 run fill 478 94 58 482 96 54 minecraft:white_concrete replace minecraft:blue_concrete
execute if score island4 island4Bool matches 1 if score trans transaction matches 1 run fill 478 94 58 482 96 54 minecraft:white_concrete replace minecraft:red_concrete
execute if score island4 island4Bool matches 1 if score trans transaction matches 1 run fill 478 94 58 482 96 54 minecraft:white_concrete replace minecraft:purple_concrete
execute if score island4 island4Bool matches 1 if score trans transaction matches 1 run setblock 480 103 56 minecraft:redstone_lamp[lit=true] replace
execute if score island4 island4Bool matches 1 if score trans transaction matches 1 run scoreboard players set island4 island4Bool 0
# Will execute only if not honey_comb and transaction == 0
execute if score island4 island4Bool matches 0 if score trans transaction matches 0 run scoreboard players set trans transaction 2
execute if score island4 island4Bool matches 0 if score trans transaction matches 2 run fill 478 94 58 482 96 54 minecraft:honeycomb_block replace minecraft:white_concrete
execute if score island4 island4Bool matches 0 if score trans transaction matches 2 run fill 478 94 58 482 96 54 minecraft:honeycomb_block replace minecraft:blue_concrete
execute if score island4 island4Bool matches 0 if score trans transaction matches 2 run fill 478 94 58 482 96 54 minecraft:honeycomb_block replace minecraft:red_concrete
execute if score island4 island4Bool matches 0 if score trans transaction matches 2 run fill 478 94 58 482 96 54 minecraft:honeycomb_block replace minecraft:purple_concrete
execute if score island4 island4Bool matches 0 if score trans transaction matches 2 run setblock 480 103 56 minecraft:redstone_lamp[lit=false] replace
execute if score island4 island4Bool matches 0 if score trans transaction matches 2 run scoreboard players set island4 island4Bool 1
# Transaction ends
scoreboard players set trans transaction 0

# Particle Effects
particle minecraft:enchant 480 96 56 2 0 2 1 100