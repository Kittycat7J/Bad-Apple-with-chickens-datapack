tellraw @a [{"text":"Kittycat7J's Bad Apple!! datapack (25w06a) ","color": "green"},{"text": "installed.","color": "green"}]

 
setblock 0 0 0 repeating_command_block{auto:1b,Command:"kill @e[type=item]"}
# Add Triggers
scoreboard objectives add bad_apple.about trigger {"text": "About","color": "green"}
scoreboard objectives add bad_apple.config trigger {"text": "Config","color": "green"}

# Add New Player Joined Flag
scoreboard objectives add bad_apple.new_player_joined dummy
scoreboard players set @a bad_apple.new_player_joined 0

# Add Install Flag
scoreboard objectives add bad_apple.installed dummy
scoreboard players set #bad_apple bad_apple.installed 1