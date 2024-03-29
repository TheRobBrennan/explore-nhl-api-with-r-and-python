# This script assumes you want a periodically updating shot chart to be generated by
# the NHL game ID defined in ./examples/Python/NHL API - Generate a shot chart for a specific NHL game ID/NHLShotChart.py

count=0
padded_count_string="%02d" # Padded count with 2 digits
log_file="shot_chart.log"

cleanup() {
    rm -f "$log_file"
    exit
}

# Once the script is interrupted, the log file will be deleted
trap cleanup SIGINT

while true; do
    count=$((count+1))
    padded_count=$(printf "$padded_count_string" "$count")  
    timestamp=$(date +'%Y-%m-%d %H:%M:%S') # Format the current time as "2023-05-25 18:00:14"
    
    # Redirect the output - By redirecting the output of the Python command to a log file, you can capture any error messages or other output for future reference
    ./.venv/bin/python "examples/Python/NHL API - Generate a shot chart for a specific NHL game ID/NHLShotChart.py" >> "$log_file"
    echo "\nExecution count: $padded_count\tTimestamp: $timestamp\n\n" >> "$log_file"

    # Display the last n lines
    tail -n 10 "$log_file"

    sleep 30
done
