# z
execute as @e[type=minecraft:arrow] at @s if block ~ ~ ~0.1 minecraft:barrier run kill @s
execute as @e[type=minecraft:arrow] at @s if block ~ ~ ~0.1 minecraft:barrier run kill @s
# x
execute as @e[type=minecraft:arrow] at @s if block ~0.1 ~ ~ minecraft:barrier run kill @s
execute as @e[type=minecraft:arrow] at @s if block ~0.1 ~ ~ minecraft:barrier run kill @s

# corner
execute as @e[type=minecraft:arrow] at @s if block ~0.1 ~ ~0.1 minecraft:barrier run kill @s
execute as @e[type=minecraft:arrow] at @s if block ~-0.1 ~ ~-0.1 minecraft:barrier run kill @s 
execute as @e[type=minecraft:arrow] at @s if block ~-0.1 ~ ~0.1 minecraft:barrier run kill @s
execute as @e[type=minecraft:arrow] at @s if block ~0.1 ~ ~-0.1 minecraft:barrier run kill @s
