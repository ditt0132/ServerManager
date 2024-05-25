## Check Player Jumping Score 

# If blue jumps 
execute as @a[scores={redblueJump=1..},tag=team_blue] run function example_pack:new_zone/blueblockhandler

# If red jumps
execute as @a[scores={redblueJump=1..},tag=team_red] run function example_pack:new_zone/redblockhandler


## Reset Jump
execute as @a[scores={redblueJump=1..}] run scoreboard players set @s redblueJump 0


