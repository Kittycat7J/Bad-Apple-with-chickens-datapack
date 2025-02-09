scoreboard objectives add bad_apple_start dummy

# Execute commands based on the frame score
execute as @a store result score temp bad_apple_start run scoreboard players get @s bad_apple_start
execute if score temp bad_apple_start matches 0 run scoreboard objectives add bad_apple.installed dummy
execute if score temp bad_apple_start matches 1 run execute unless score #bad_apple bad_apple.installed matches 1 run function bad_apple:config/install
execute if score temp bad_apple_start matches 2 run execute as @a in minecraft:overworld run kill @e[type=!player]
execute if score temp bad_apple_start matches 3 run execute as @a in minecraft:overworld run summon axolotl 0 90 0 {Tags:["bad_apple_marker"],NoAI:1b,Invulnerable:1b,active_effects:[{id:"invisibility",amplifier:1,duration:999999,show_particles:0b}]}
execute if score temp bad_apple_start matches 4 run execute as @a in minecraft:overworld run fill 0 100 -1 31 131 25 minecraft:air
execute if score temp bad_apple_start matches 5 run execute as @a in minecraft:overworld run fill -5 95 -1 36 136 -1 minecraft:black_concrete
execute if score temp bad_apple_start matches 6 run execute as @a in minecraft:overworld run setblock 15 114 25 glass
execute if score temp bad_apple_start matches 7 run execute as @a in minecraft:overworld run tp @s 15.5 115 25.5 -180 0
execute if score temp bad_apple_start matches 8 run schedule clear bad_apple:main_loop
execute if score temp bad_apple_start matches 9 run execute as @s run scoreboard players set @s bad_apple_frame 0
execute if score temp bad_apple_start matches 9 run execute at @e[tag=bad_apple_marker] run function bad_apple:spawn_chicken_grid

# Remove scoreboard and clear function when it is greater than or equal to 11
execute if score temp bad_apple_start matches ..12 run execute as @a run scoreboard players add @s bad_apple_start 1
execute if score temp bad_apple_start matches 13.. run scoreboard objectives remove bad_apple_start
execute if score temp bad_apple_start matches 13.. run schedule clear bad_apple:start

# Schedule the next tick
execute if score temp bad_apple_start matches ..12 run schedule function bad_apple:start 3t