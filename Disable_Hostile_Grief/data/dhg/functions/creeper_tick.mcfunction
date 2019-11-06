# enable tracking of creepers by giving them an effect that is impossible in survival
effect give @e[type=minecraft:creeper, nbt=!{NoAI:1b}] minecraft:hunger 1 3 true

# simulate game rule mobGriefing = false creeper explosions
execute at @e[type=minecraft:area_effect_cloud, nbt={Effects:[{Id:17b,Amplifier:3b}]}] run function dhg:sim_creeper
kill @e[type=minecraft:area_effect_cloud, nbt={Effects:[{Id:17b,Amplifier:3b}]}]

scoreboard players set @a[scores={dhg.ckill=2..}] dhg.ckill 0
scoreboard players set @a[scores={dhg.ckill=1..}] dhg.ckill 2