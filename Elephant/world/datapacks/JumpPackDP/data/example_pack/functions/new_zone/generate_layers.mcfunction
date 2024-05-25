# Layer 1 RED
# Cleans the state
fill 436 127 -4 488 155 10 minecraft:air replace minecraft:red_terracotta
# Only Red Terracota
clone 488 119 10 436 91 -4 436 127 -4 filtered minecraft:red_terracotta

# Layer 2 PINK
# Cleans State
fill 436 158 -4 488 186 10 minecraft:air replace minecraft:red_terracotta
# Only Pink
clone 488 119 10 436 91 -4 436 158 -4 filtered minecraft:pink_terracotta
# Replace Pink to Red
fill 436 158 -4 488 186 10 minecraft:red_terracotta replace minecraft:pink_terracotta

# Layer 3 BLUE
fill 488 83 10 436 55 -4 minecraft:air replace minecraft:blue_terracotta
clone 488 119 10 436 91 -4 436 55 -4 filtered minecraft:blue_terracotta


# Layer 4 LIGHT BLUE
fill 488 52 10 436 24 -4 minecraft:air replace minecraft:blue_terracotta
clone 488 119 10 436 91 -4 436 24 -4 filtered minecraft:light_blue_terracotta
fill 488 52 10 436 24 -4 minecraft:blue_terracotta replace minecraft:light_blue_terracotta