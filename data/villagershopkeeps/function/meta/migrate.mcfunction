
# Ensure the master scoreboard exists
scoreboard objectives add villagershopkeeps.master dummy

# Apply migration if required
execute unless score version villagershopkeeps.master matches 1.. run function villagershopkeeps:meta/migrations/latest_version
