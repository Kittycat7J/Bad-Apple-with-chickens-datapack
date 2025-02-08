tellraw @a [{"text":"Brainage's Template (1.21) ","color": "green"},{"text": "installed.","color": "green"}]

function bad_apple:sounds/click

# Add Triggers
scoreboard objectives add bad_apple.about trigger {"text": "About","color": "green"}
scoreboard objectives add bad_apple.config trigger {"text": "Config","color": "green"}

# Add New Player Joined Flag
scoreboard objectives add bad_apple.new_player_joined dummy
scoreboard players set @a bad_apple.new_player_joined 0

# Add Install Flag
scoreboard objectives add bad_apple.installed dummy
scoreboard players set #bad_apple bad_apple.installed 1