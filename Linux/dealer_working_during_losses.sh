#!bin/bash
# Made by: Jacob
# Dealer working during losse
# Arguments: 1-Date(mm/dd format) 2-Time(00:00:00 format) 3-AM/PM
# Created : 11/6/21

# Print the date searched 
echo $1 >>  Dealers_working_during_losses

# Serach log file by date and time, to find the dealer first and last name, append the results to file.
awk -F" " '{print $1, $2, $5, $6}' $1_Dealer_schedule |  grep -i $2 | grep -i $3  >> Dealers_working_during_losses

# Print edited file on screen for verification
cat Dealers_working_during_losses



