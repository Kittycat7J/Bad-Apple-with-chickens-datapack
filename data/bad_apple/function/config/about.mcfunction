tellraw @s {"text": "                                ","color": "gray","strikethrough": true}
tellraw @s {"text": "Brainage's Template | About","color": "gray"}
tellraw @s {"text": "                                ","color": "gray","strikethrough": true}

tellraw @s {"text": "No about section yet.","color": "gray"}

tellraw @s {"text": "                                ","color": "gray","strikethrough": true}

function bad_apple:sounds/click

# Reset Trigger
scoreboard players set @s bad_apple.about 0
scoreboard players enable @s bad_apple.about