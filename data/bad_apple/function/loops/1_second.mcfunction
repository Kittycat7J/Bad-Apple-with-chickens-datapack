

# Loop

schedule function bad_apple:loops/1_second 1s
tellraw @a {"text":"1 sec"}
execute as @e[tag=bad_apple_marker,limit=1] run scoreboard players add @s bad_apple_frame 1