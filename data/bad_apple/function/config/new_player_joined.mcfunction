tellraw @s [{"text": " | ","color": "yellow"},{"text":"Brainage's Template (1.21)","color": "green"},{"text": " | ","color": "yellow"},{"text": "ABOUT","color": "green","hoverEvent": {"action": "show_text","value": [{"text": "Click to learn about Brainage's Template.\n","color": "white"},{"text": "Executes command \"/trigger bad_apple.about\"","color": "gray"}]},"clickEvent": {"action": "run_command","value": "/trigger bad_apple.about"}},{"text": " | ","color": "yellow"},{"text": "CONFIG","color": "green","hoverEvent": {"action": "show_text","value": [{"text": "Click to configure Brainage's Template.\n","color": "white"},{"text": "Executes command \"/trigger bad_apple.config\"","color": "gray"}]},"clickEvent": {"action": "run_command","value": "/trigger bad_apple.config"}},{"text": " | ","color": "yellow"}]

# Flag Player as Joined
scoreboard players set @s bad_apple.new_player_joined 1

# Enable Triggers
scoreboard players enable @s bad_apple.about
scoreboard players enable @s bad_apple.config