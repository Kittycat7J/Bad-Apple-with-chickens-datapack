tellraw @a [{"text":"Brainage's Template (1.21)","color": "green"},{"text": " loaded. | ","color": "yellow"},{"text": "ABOUT","color": "green","hoverEvent": {"action": "show_text","value": [{"text": "Click to learn about Brainage's Template.\n","color": "white"},{"text": "Executes command \"/trigger bad_apple.about\"","color": "gray"}]},"clickEvent": {"action": "run_command","value": "/trigger bad_apple.about"}},{"text": " | ","color": "yellow"},{"text": "CONFIG","color": "green","hoverEvent": {"action": "show_text","value": [{"text": "Click to configure Brainage's Template.\n","color": "white"},{"text": "Executes command \"/trigger bad_apple.config\"","color": "gray"}]},"clickEvent": {"action": "run_command","value": "/trigger bad_apple.config"}}]

# Check for Install
scoreboard objectives add bad_apple.installed dummy
execute unless score #bad_apple bad_apple.installed matches 1 run function bad_apple:config/install

# Reload 1 Second Loop
schedule clear bad_apple:loops/1_second
function bad_apple:loops/1_second