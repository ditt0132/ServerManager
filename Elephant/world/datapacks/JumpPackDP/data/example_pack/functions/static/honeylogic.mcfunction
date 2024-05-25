execute as @a at @s if block ~ ~-0.8 ~ minecraft:honey_block run tp @s ~ ~0.1 ~

# honey -> redstone
execute at @s run fill 560 119 3 512 96 -17 minecraft:redstone_block replace minecraft:honey_block
execute at @s run fill 512 96 23 560 119 4 minecraft:redstone_block replace minecraft:honey_block
execute at @s run fill 560 102 -7 571 96 11 minecraft:redstone_block replace minecraft:honey_block
execute at @s run fill 511 106 -7 499 96 13 minecraft:redstone_block replace minecraft:honey_block
# comb -> honey
execute at @s run fill 560 119 3 512 96 -17 minecraft:honey_block replace minecraft:honeycomb_block
execute at @s run fill 512 96 23 560 119 4 minecraft:honey_block replace minecraft:honeycomb_block
execute at @s run fill 560 102 -7 571 96 11 minecraft:honey_block replace minecraft:honeycomb_block
execute at @s run fill 511 106 -7 499 96 13 minecraft:honey_block replace minecraft:honeycomb_block
# redstone -> comb
execute at @s run fill 560 119 3 512 96 -17 minecraft:honeycomb_block replace minecraft:redstone_block
execute at @s run fill 512 96 23 560 119 4 minecraft:honeycomb_block replace minecraft:redstone_block
execute at @s run fill 560 102 -7 571 96 11 minecraft:honeycomb_block replace minecraft:redstone_block
execute at @s run fill 511 106 -7 499 96 13 minecraft:honeycomb_block replace minecraft:redstone_block
