
# Check for Install
scoreboard objectives add bad_apple.installed dummy
execute unless score #bad_apple bad_apple.installed matches 1 run function bad_apple:config/install

# Reload 1 Second Loop
schedule clear bad_apple:loops/1_second
function bad_apple:loops/1_second