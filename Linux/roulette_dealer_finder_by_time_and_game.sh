#!bin/bash
# Made by: Jacob
# Game Dealer Finder By Time 
# Arguments: 1-Date(mm/dd format) 2-Time(00:00:00AM/PM format)
# For accurate results file "Roulette_Dealer_By_Time_And_Game" in needed. 
# Created : 11/8/21


# Append the date to the document file (file is pre created as table to see the results requested by game type)
echo Date $1 >> Roulette_Dealer_By_Time_And_Game

# Serach log file by date, add the requsted fields to the table file. 
sed s/" "// $1_Dealer_schedule |  awk -F" " '{print $1, $2, $3, $4, $5, $6, $7}' | grep -i $2 >> Roulette_Dealer_By_Time_And_Game

# Print results on screen for verification. 
cat Roulette_Dealer_By_Time_And_Game


