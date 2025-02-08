tellraw @s {"text": "                                ","color": "gray","strikethrough": true}
tellraw @s {"text": "Brainage's Template | Config","color": "gray"}
tellraw @s {"text": "                                ","color": "gray","strikethrough": true}

tellraw @s {"text": "No config section yet.","color": "gray"}
tellraw @s ""

# Install/Uninstall Functions

tellraw @s {"text": "                                ","color": "gray","strikethrough": true}

function bad_apple:sounds/click

# Reset Trigger
scoreboard players set @s bad_apple.config 0
scoreboard players enable @s bad_apple.config