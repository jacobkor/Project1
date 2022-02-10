#!bin/bash
# Made by: Jacob
# Roulette Dealer Finder By Time
# Arguments: 1-Date(mm/dd format) 2-Time(00:00:00AM/PM format)
# Created : 11/7/21

# Print the date searched 
echo Date $1 

# Remove the space between the hours:minutes:seconds and am/pm. search log file by the time to find dealer first and last name.  
sed s/" "// $1_Dealer_schedule |  awk -F" " '{print $1, $4, $5}' | grep -i $2

 



