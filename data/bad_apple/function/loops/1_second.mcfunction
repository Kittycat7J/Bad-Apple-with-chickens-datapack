

# Loop
execute as @e[tag=bad_apple_marker,limit=1] run scoreboard players add @s bad_apple_frame 1
schedule function bad_apple:loops/1_second 0.3s