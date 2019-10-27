# prevent loot pickup by zombies 
execute as @e[type=minecraft:zombie,nbt=!{CanPickUpLoot:0b}] run data merge entity @s {CanPickUpLoot:0b}
execute as @e[type=minecraft:drowned,nbt=!{CanPickUpLoot:0b}] run data merge entity @s {CanPickUpLoot:0b}
execute as @e[type=minecraft:husk,nbt=!{CanPickUpLoot:0b}] run data merge entity @s {CanPickUpLoot:0b}
execute as @e[type=minecraft:zombie_pigman,nbt=!{CanPickUpLoot:0b}] run data merge entity @s {CanPickUpLoot:0b}
execute as @e[type=minecraft:zombie_villager,nbt=!{CanPickUpLoot:0b}] run data merge entity @s {CanPickUpLoot:0b}

# prevent loot pickup by skeletons
execute as @e[type=minecraft:skeleton,nbt=!{CanPickUpLoot:0b}] run data merge entity @s {CanPickUpLoot:0b}
execute as @e[type=minecraft:wither_skeleton,nbt=!{CanPickUpLoot:0b}] run data merge entity @s {CanPickUpLoot:0b}
execute as @e[type=minecraft:stray,nbt=!{CanPickUpLoot:0b}] run data merge entity @s {CanPickUpLoot:0b}