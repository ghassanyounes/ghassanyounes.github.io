scoreboard objectives add dhg.dummy dummy

#load config
function dhg:config

# correct config values outside expected ranges
execute unless score creeper dhg.dummy matches ..0 run scoreboard players set creeper dhg.dummy 1
execute unless score creeper dhg.dummy matches 1.. run scoreboard players set creeper dhg.dummy 0

execute unless score ghast dhg.dummy matches ..0 run scoreboard players set ghast dhg.dummy 1
execute unless score ghast dhg.dummy matches 1.. run scoreboard players set ghast dhg.dummy 0

execute unless score pickup dhg.dummy matches ..0 run scoreboard players set pickup dhg.dummy 1
execute unless score pickup dhg.dummy matches 1.. run scoreboard players set pickup dhg.dummy 0