tellraw @s {"text": "                                ","color": "gray","strikethrough": true}
tellraw @s {"text": "Brainage's Template | Config","color": "gray"}
tellraw @s {"text": "                                ","color": "gray","strikethrough": true}

tellraw @s {"text": "No config section yet.","color": "gray"}
tellraw @s ""

# Install/Uninstall Functions
tellraw @s {"text": "INSTALL DATAPACK","color": "green","hoverEvent": {"action": "show_text","contents": [{"text": "Click to INSTALL this datapack.","color": "green"}]},"clickEvent": {"action": "suggest_command","value": "/function bad_apple:config/install"}}
tellraw @s {"text": "UNINSTALL DATAPACK","color": "red","hoverEvent": {"action": "show_text","contents": [{"text": "Click to UNINSTALL this datapack.","color": "red"}]},"clickEvent": {"action": "suggest_command","value": "/function bad_apple:config/uninstall"}}

tellraw @s {"text": "                                ","color": "gray","strikethrough": true}

function bad_apple:sounds/click

# Reset Trigger
scoreboard players set @s bad_apple.config 0
scoreboard players enable @s bad_apple.config