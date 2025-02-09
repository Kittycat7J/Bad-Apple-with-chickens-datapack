def generate_main_loop(mcfunction_file, total_frames=207):
    """
    Generates a .mcfunction file that loops through frames correctly.

    Args:
        mcfunction_file (str): The name of the mcfunction file to save the commands to.
        total_frames (int): The total number of frames (default is 207).
    """
    with open(mcfunction_file, "w") as file:
        # Initialize scoreboard objective (only needs to be run once)
        file.write("# Initialize scoreboard objective\n")
        file.write("scoreboard objectives add bad_apple_frame dummy\n")
        file.write("scoreboard objectives add #temp dummy\n\n")  # Temporary scoreboard for dynamic execution

        # Bad Apple Main Loop
        file.write("# Bad Apple Main Loop\n")

        # Increment frame counter
        file.write("execute as @e[tag=bad_apple_marker,limit=1] run scoreboard players add @s bad_apple_frame 1\n\n")

        # Reset frame counter after total_frames
        file.write(f"# Reset after {total_frames} frames\n")
        file.write(f"execute as @e[tag=bad_apple_marker,limit=1] if score @s bad_apple_frame matches {total_frames} run scoreboard players set @s bad_apple_frame 0\n\n")

        # Dynamic frame execution
        file.write("# Execute frame function dynamically\n")
        file.write("execute as @e[tag=bad_apple_marker,limit=1] store result score #temp bad_apple_frame run scoreboard players get @s bad_apple_frame\n")
        for i in range(total_frames):
            file.write(f"execute if score #temp bad_apple_frame matches {i} run function bad_apple:frames/frame_{i:03d}\n")

        # Schedule the next tick
        file.write("\n# Schedule the next tick\n")
        file.write("schedule function bad_apple:main_loop 1t\n")

    print(f"mcfunction file '{mcfunction_file}' has been generated.")

# Specify the output file and generate the main loop function
mcfunction_file = "main_loop.mcfunction"
generate_main_loop(mcfunction_file)