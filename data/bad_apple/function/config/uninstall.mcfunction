tellraw @a [{"text":"Brainage's Template (1.21) ","color": "green"},{"text": "uninstalled.","color": "red"}]

function bad_apple:sounds/click

# Remove Triggers
scoreboard objectives remove bad_apple.about
scoreboard objectives remove bad_apple.config

# Remove New Player Joined Flag
scoreboard objectives remove bad_apple.new_player_joined

# Remove Install Flag
scoreboard objectives remove bad_apple.installed