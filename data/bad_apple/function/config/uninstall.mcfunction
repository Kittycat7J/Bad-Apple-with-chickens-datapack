tellraw @a [{"text":"Kittycat7J's Bad Apple!! datapack (25w06a) ","color": "green"},{"text": "uninstalled.","color": "red"}]

schedule clear bad_apple:main_loop
execute as @a in minecraft:overworld run kill @e[type=!player]
# Remove Triggers
scoreboard objectives remove bad_apple.about
scoreboard objectives remove bad_apple.config
scoreboard objectives remove bad_apple_frame
scoreboard players reset #bad_apple bad_apple_frame
scoreboard players reset @e temp 
# Remove New Player Joined Flag
scoreboard objectives remove bad_apple.new_player_joined

# Remove Install Flag
scoreboard objectives remove bad_apple.installed