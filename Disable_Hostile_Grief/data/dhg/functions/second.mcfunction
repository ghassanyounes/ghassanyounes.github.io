#disable creeper terrain damage
execute if score creeper dhg.dummy matches 1.. run function dhg:creeper_second

#disable ghast fireball damage
execute if score ghast dhg.dummy matches 1.. run function dhg:ghast_second

# prevent loot pickup by hostile mobs
execute if score pickup dhg.dummy matches 1.. run function dhg:pickup_second