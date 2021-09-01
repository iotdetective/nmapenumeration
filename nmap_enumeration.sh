#!/bin/bash
clear
# This is the area of input for output enumeration file name
echo "Welcome to the IoT Detective enumeration script V1.0"
echo "===================================================="
echo "                                                    "
echo "     This script will create an output report within"
echo "your /tmp/ folder with results of all the enumerati-"
echo "on scans that are run from within this script.      "
echo "                                                    "
echo "                                                    "
echo "                                                    "
echo "Please input your desired filename with .txt extens-"
echo "ion for the report.                                 "
echo "                                                    "
echo -n "Filename: "
read report
echo "                                                    "
echo "====================================================" | tee -a $report
echo "Your final report can be found at /tmp/"$report | tee -a $report
echo "====================================================" | tee -a $report
sleep 3s
echo "                                                    "
echo "                                                    "
clear
# Intro screen displayed with text menu.
echo "[=]=[=]=[=]=[=]=[=]=[=]=[=]=[=]=[=]=[=]=[=]=[=]=[=]="
echo "-----IOTDETECTIVE-NMAP-ENUMERATION-SCRIPT--V1.0-----"
echo "                                                    "
echo "                  ^     ^     ^                     "
echo "                [    \/   \/    ]                   "
echo "                 \             /                    "
echo "                 /   o-----o   \                    "
echo "                /   /~~     \   \                   "
echo "               /   /  ~~     \   \                  "
echo "              [   o    (0)    o   ]                 "
echo "               \   \     ~~  /   /                  "
echo "                \   \     ~~/   /                   "
echo "                 \   o-----o   /                    "
echo "                  \__       __/                     "
echo "                     \     /                        "
echo "                      -----                         "
echo "                                                    "
echo "[=]=[=]=[=]=[=]=[=]=[=]=[=]=[=]=[=]=[=]=[=]=[=]=[=]="
echo "                                                    ";
echo "1. Ping scan for target(s) on a network."
echo "2. Service and port enumeration of network targets. "
echo "3. Advanced port scan of specified target."
echo "4. Advanced port scan of target using XMAS."
echo "5. Exit"
echo -n "Enter your menu choice [1-5]: "

# Running a forever loop using while statement
# This loop will run untill select the exit option.
# User will be asked to select option again and again
while :
do

# reading choice
read choice

# case statement is used to compare one value with the multiple cases.
case $choice in
  # Selection 1 - Ping Network Scan
  1)  clear
      echo "Get ready to run the great and powerful ping!	"
      echo "===================================================="
      echo "Enter your target network IP with cider notation.   "
      echo "For example 192.168.1.0/24                          "
      echo -n "Target Network: "
      read network
      echo "===================================================="
      echo "Target network:"$network
      echo "Here comes the ping!                                "
      echo "COMMAND BEING EXECUTED: nmap -sn "$network
      nmap -sn $network | tee -a /tmp/$report
      echo "                                                    "
      echo "==============End of Ping Scan Report===============" | tee -a /tmp/$report;;
  # Selection 2 - Target Network Scan
  2)  clear
      echo "You have selected the network target scan option!   "
      echo "===================================================="
      echo "Enter your target network IP with cider notation.   "
      echo "For example 192.168.1.0/24                          "
      echo -n "Target Network: "
      read network
      echo "===================================================="
      echo "Target network:"$network
      echo "Please be patient, this scan can take some time.   "
      echo "COMMAND BEING EXECUTED: nmap -T4 -sC -A "$network
      nmap -T4 -sC -A $network | tee -a /tmp/$report
      echo "                                                    "
      echo "============End of Target Network Report============" | tee -a /tmp/$report;;
  # Selection 3 - Advanced port scan of target IP
  3)  clear
      echo "Advanced port scan of a target IP address           "
      echo "===================================================="
      echo -n "Enter your target IP: "
      read ip
      echo "===================================================="
      echo "Target IP selected as:"$ip
      echo -n "Enter ports, comma seperated (i.e. 80,443,22): "
      read ports
      echo "Target ports are: "$ports
      echo "Please be patient, this scan can take some time.   "
      echo "COMMAND BEING EXECUTED: nmap -T4 -sT -A -p "$ports $ip
      nmap -T4 -sT -A -p $ports $ip | tee -a /tmp/$report
      echo "                                                    "
      echo "===========End of Target Port Scan Report===========" | tee -a /tmp/$report;;

  # Selection 4 - Advanced port scan of target IP XMAS option
  4)  clear
      echo "Advanced port scan of a target IP address           "
      echo "===================================================="
      echo -n "Enter your target IP: "
      read ip
      echo "===================================================="
      echo "Target IP selected as:"$ip
      echo -n "Enter ports, comma seperated (i.e. 80,443,22): "
      read ports
      echo "Target ports are: "$ports
      echo "Please be patient, this scan can take some time.   "
      echo "COMMAND BEING EXECUTED: sudo nmap -T4 -sX -A -p "$ports $ip
      sudo nmap -T4 -sX -A -p $ports $ip | tee -a /tmp/$report
      echo "                                                    "
      echo "===========End of Target XMAS Scan Report===========" | tee -a /tmp/$report;;

  # Selection 5 - Exit command
  5)  echo "Thank you for choosing the IoT Detective Enumberation"
      echo "script!                                              "
      echo "                                                     "
      echo "Don't forget that your report is saved to:           "
      echo "/tmp/"$report
      echo "==================================================== "
      exit;;
  # Imporper choice input into prompts = repeat effect
  *) echo "invalid option";;
  
esac
  echo "                                                    "
  echo "1. Ping scan for target(s) on a network."
  echo "2. Service and port enumeration of network targets. "
  echo "3. Advanced port scan of specified target."
  echo "4. Advanced port scan of target using XMAS."
  echo "5. Exit"
  echo -n "Enter your menu choice [1-5]: "

done
