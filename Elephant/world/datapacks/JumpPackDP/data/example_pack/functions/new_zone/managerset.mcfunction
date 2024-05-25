## Set Up Score Boards
scoreboard objectives add redblueJump minecraft.custom:minecraft.jump

scoreboard objectives add blueBlock dummy
scoreboard objectives add redBlock dummy
scoreboard objectives add redblueTrans dummy

scoreboard players set redbluetrans redblueTrans 0
scoreboard players set blueBlockBool blueBlock 0
scoreboard players set redBlockBool redBlock 0