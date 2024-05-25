###### Jump Boost

### Create scoreboards
scoreboard objectives add utilySneak minecraft.custom:minecraft.sneak_time
scoreboard objectives add utilyJump minecraft.custom:minecraft.jump
scoreboard objectives add jumpCharge dummy
scoreboard objectives add utilyXp dummy
scoreboard objectives add xpCharge dummy

execute as @a[scores={utilySneak=1..,jumpCharge=..59},nbt={SelectedItem:{id:"minecraft:diamond_hoe",Count:1b},OnGround:1b}] run scoreboard players add @s jumpCharge 1

execute as @a unless entity @s[scores={utilySneak=1..},nbt={SelectedItem:{id:"minecraft:diamond_hoe",Count:1b},OnGround:1b}] run scoreboard players set @s jumpCharge 0

#### Sound Effect End
execute as @a if entity @s[nbt={ActiveEffects:[{Id:8b}],SelectedItem:{id:"minecraft:diamond_hoe",Count:1b},OnGround:0b},scores={utilyJump=1..}] run playsound minecraft:block.bubble_column.whirlpool_inside ambient @s ~ ~ ~ 100 1 1

### Particle Effect End
execute as @a if entity @s[nbt={ActiveEffects:[{Id:8b}],SelectedItem:{id:"minecraft:diamond_hoe",Count:1b},OnGround:0b},scores={utilyJump=1..}] at @s run particle minecraft:cloud ~ ~-1 ~ 2 0 2 1 100 normal @a


#execute as @a unless entity @s[scores={utilySneak=1..},nbt={SelectedItem:{id:"minecraft:diamond_hoe",Count:1b},OnGround:1b}] run effect clear @s minecraft:jump_boost


### Xp Effect
## Giving

# lvl 1
execute as @a[scores={jumpCharge=1..15,utilyXp=..3},nbt={OnGround:1b}] unless entity @a[nbt={XpLevel:1}] run scoreboard players add @s utilyXp 1

# lvl 2
execute as @a[scores={jumpCharge=16..30,utilyXp=..2},nbt={OnGround:1b}] run scoreboard players add @s utilyXp 1

# lvl 3
execute as @a[scores={jumpCharge=31..45,utilyXp=..2},nbt={OnGround:1b}] run scoreboard players add @s utilyXp 1

# lvl 4
execute as @a[scores={jumpCharge=45..60,utilyXp=..2},nbt={OnGround:1b}] run scoreboard players add @s utilyXp 1

## Removing

# lvl 1
execute as @a if entity @a[scores={utilyXp=3..,jumpCharge=1..15}] run xp add @s 1 points
execute as @a if entity @a[scores={jumpCharge=1..15,utilyXp=4..}] run scoreboard players set @s utilyXp 0

# lvl 2
execute as @a if entity @a[scores={utilyXp=2..,jumpCharge=16..30}] run xp add @s 1 points
execute as @a if entity @a[scores={jumpCharge=16..30,utilyXp=3..}] run scoreboard players set @s utilyXp 0
execute as @a if entity @a[scores={jumpCharge=20}] run scoreboard players remove @s utilyXp 1
execute as @a if entity @a[scores={jumpCharge=25}] run scoreboard players remove @s utilyXp 1
execute as @a if entity @a[scores={jumpCharge=28}] run scoreboard players remove @s utilyXp 1

# lvl 3
execute as @a if entity @a[scores={utilyXp=2..,jumpCharge=31..45}] run xp add @s 1 points
execute as @a if entity @a[scores={jumpCharge=31..45,utilyXp=3..}] run scoreboard players set @s utilyXp 0

# lvl 4
execute as @a if entity @a[scores={utilyXp=2..,jumpCharge=45..59}] run xp add @s 1 points
execute as @a if entity @a[scores={jumpCharge=45..,utilyXp=4..}] run scoreboard players set @s utilyXp 0


## Reset Xp
execute as @a unless entity @s[scores={jumpCharge=1..}] run xp set @s 0 levels
execute as @a unless entity @s[scores={jumpCharge=1..}] run xp set @s 0 points


#### Jump Effects
execute as @a[scores={jumpCharge=15..}] run effect give @s minecraft:jump_boost 1 1 true
execute as @a[scores={jumpCharge=30..}] run effect give @s minecraft:jump_boost 1 2 true
execute as @a[scores={jumpCharge=45..}] run effect give @s minecraft:jump_boost 1 3 true
execute as @a[scores={jumpCharge=60..}] run effect give @s minecraft:jump_boost 1 5 true

#### Sound Effects
execute as @a[scores={jumpCharge=15}] run playsound minecraft:entity.arrow.hit_player ambient @s ~ ~ ~ 20 1 1
execute as @a[scores={jumpCharge=30}] run playsound minecraft:entity.arrow.hit_player ambient @s ~ ~ ~ 20 1 1
execute as @a[scores={jumpCharge=45}] run playsound minecraft:entity.arrow.hit_player ambient @s ~ ~ ~ 20 1 1
execute as @a[scores={jumpCharge=59}] run playsound minecraft:entity.arrow.hit_player ambient @s ~ ~ ~ 20 1 1

#### Particle Effects


## Clear Item
#execute as @a[nbt={ActiveEffects:[{Id:8b}],SelectedItem:{id:"minecraft:diamond_hoe",Count:1b}},scores={utilyJump=1..}] run effect clear @s minecraft:jump_boost


## Clear Scoreboard
scoreboard players remove @a[scores={utilyJump=1..}] utilyJump 1
scoreboard players remove @a[scores={utilySneak=1..}] utilySneak 1
