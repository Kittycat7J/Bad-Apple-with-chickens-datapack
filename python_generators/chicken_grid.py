def generate_chicken_grid(mcfunction_file, grid_size=32, height_offset=10):
    """
    Generates a .mcfunction file that spawns chickens in a 64x64 grid.
    Each chicken will be spaced out by 1 block along the X and Y axes.

    Args:
        mcfunction_file (str): The name of the mcfunction file to save the commands to.
        grid_size (int): The size of the grid (default is 64x64).
        height_offset (int): The Y-coordinate offset to move the entire grid up.
    """
    with open(mcfunction_file, "w") as file:
        # Loop to generate chicken spawn commands for a 64x64 grid
        for x in range(grid_size):
            for y in range(grid_size):
                # Write the command to spawn a chicken at the specific (x, y) position
                command = f"summon minecraft:chicken ~{x} ~{y + height_offset} ~ {{NoAI:1b,Tags:[\"bad_apple_chicken\"]}}\n"
                file.write(command)

        # Add the command to start the main loop at the end
        file.write("\n# Start the main loop\n")
        file.write("function bad_apple:main_loop\n")

    print(f"mcfunction file '{mcfunction_file}' has been generated with a {grid_size}x{grid_size} grid of chickens.")

# Specify the output file and generate the chicken grid
mcfunction_file = "spawn_chicken_grid.mcfunction"
generate_chicken_grid(mcfunction_file)
