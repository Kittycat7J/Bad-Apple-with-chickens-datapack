import zipfile
import os
import numpy as np
from PIL import Image
import shutil

# Function to convert PNG image to mcfunction commands
def png_to_mcfunction(png_file, frame_num, grid_size=32, starter_y=100):
    """
    Converts a PNG image to mcfunction commands for updating chicken variants.

    Args:
        png_file (str): Path to the PNG file.
        frame_num (int): Frame number for the output filename.
        grid_size (int): Size of the grid (default is 32x32).
        starter_y (int): Y-coordinate of the starter chicken (default is 100).

    Returns:
        str: Filename of the generated .mcfunction file.
    """
    img = Image.open(png_file).convert('L')  # Convert image to grayscale
    img_data = np.array(img)

    mcfunction_commands = []

    mcfunction_commands.append(f'tellraw @a ["",{{"text":"Current Frame: ","color":"green"}},{{"text":"{frame_num:03d}"}}]')

    # Generate mcfunction commands for the grid
    for y in range(grid_size):
        for x in range(grid_size):
            # Exact coordinates for the chicken
            chicken_x = x + 0.5  # X-coordinate starts at 0.5 and increments by 1
            chicken_y = starter_y + (grid_size - 1 - y)  # Invert Y-axis to fix upside-down issue
            chicken_z = 0.5  # Z-coordinate is always 0.5

            # Determine variant based on pixel color
            variant = "temperate" if img_data[y][x] > 128 else "cold"

            # Command to update the chicken's variant
            command = f"execute as @e[tag=bad_apple_chicken,x={chicken_x},y={chicken_y},z={chicken_z},distance=0] run data merge entity @s {{variant:\"{variant}\"}}"
            mcfunction_commands.append(command)

    # Save as .mcfunction
    mcfunction_filename = f"frame_{frame_num:03d}.mcfunction"
    with open(mcfunction_filename, 'w') as file:
        file.write("\n".join(mcfunction_commands))

    return mcfunction_filename

# Function to process the zip file and convert all PNGs to mcfunctions
def process_zip(input_zip, output_zip, grid_size=32, starter_y=100):
    """
    Processes a ZIP file of PNG frames and converts them to mcfunction files.

    Args:
        input_zip (str): Path to the input ZIP file.
        output_zip (str): Path to the output ZIP file.
        grid_size (int): Size of the grid (default is 32x32).
        starter_y (int): Y-coordinate of the starter chicken (default is 100).
    """
    with zipfile.ZipFile(input_zip, 'r') as zip_ref:
        temp_dir = "temp"
        os.makedirs(temp_dir, exist_ok=True)
        zip_ref.extractall(temp_dir)

        png_files = sorted([f for f in os.listdir(temp_dir) if f.lower().endswith('.png')])

        mcfunction_files = []
        for idx, png_file in enumerate(png_files):
            png_path = os.path.join(temp_dir, png_file)
            mcfunction_file = png_to_mcfunction(png_path, idx, grid_size, starter_y)
            mcfunction_files.append(mcfunction_file)

        with zipfile.ZipFile(output_zip, 'w') as zip_out:
            for mcfunction_file in mcfunction_files:
                zip_out.write(mcfunction_file, os.path.basename(mcfunction_file))
                os.remove(mcfunction_file)  # Clean up

        shutil.rmtree(temp_dir)  # Delete extracted PNGs

    print(f"Finished processing. Output ZIP: {output_zip}")

# Main function
def main():
    input_zip = "input_frames.zip"  # Input: ZIP with PNG frames
    output_zip = "frames_mcfunctions.zip"  # Output: ZIP with mcfunction files
    process_zip(input_zip, output_zip)

if __name__ == "__main__":
    main()