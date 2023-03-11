DELAY_IN_SECONDS <- 15
NHL_SCOREBOARD_SCRIPT <- sprintf("%s/examples/R-lang/National Hockey League - NHL/NHL API - Example to view data for a specific NHL game ID/NHL-API-view-data-for-a-specific-game-id.R", getwd())
WHL_SCOREBOARD_SCRIPT <- sprintf("%s/examples/R-lang/Western Hockey League - WHL/WHL API - Initial data exploration/WHL-API-view-data-for-a-specific-game-id.R", getwd())

while (TRUE) {
  print(paste("Refreshing NHL and WHL scoreboard data at", Sys.time()))

  # Read in the source files
  source(NHL_SCOREBOARD_SCRIPT)
  source(WHL_SCOREBOARD_SCRIPT)
  
  # View the data frame
  View(nhl_scoreboard_dataframe)
  View(whl_scorebar_dataframe_filtered)

  # Wait for at least X seconds
  Sys.sleep(DELAY_IN_SECONDS)
}