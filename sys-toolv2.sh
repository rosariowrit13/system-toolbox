#!/bin/bash

LOGFILE="log.txt"

touch "$LOGFILE"

log_action(){ 
      echo "[ $(date '+%F +%T')] User selected: $1" >> "$LOGFILE"    
}

pause_action(){
     read -p "Press enter to continue..."

}

menu (){

    echo "================================="
    echo "     🔧 SYSTEM TOOLBOX           "     
    echo "================================="
    echo "1.Show Date & Time"
    echo "2.Show Current Folder"
    echo "3.List Files"
    echo "4.Show Disk Space"
    echo "5.Show Memory Usage"
    echo "6.Show Running Rrocess"
    echo "7.Show Current User"
    echo "8.Search Process"
    echo "9.Show IP Address"
    echo "10.View Logs"
    echo "11.Clear Logs"
    echo "12.Exit"
}

show_date() {
    date
    log_action "Date"
}

show_folder() {
    pwd
    log_action "Current folder"
}

show_file(){
    ls -lh
    log_action "File lists"
}

show_disk(){
    df -h
    log_action "Disk Space"
}

show_memory(){
    systeminfo | grep "Total Physical Memory"
    systeminfo | grep "Avilable Physical memory"
    log_action "Memory Usage"
}

run_process(){
    ps -f
    log_action "Running Process"
}

user_info(){
    whoami
    log_action "User Info"
}

search_process(){
    read -p "Enter process name: " pname
    ps | grep $pname
    log_action "Search process: $pname"
}

ip_address(){
    ipconfig | grep IPv4
    log_action "Show IP Address"
}

view_log(){
    cat "$LOGFILE"
}
clear_log(){
    > $"LOGFILE"
    echo "log cleared."
    log_action "Logs Cleared"
}

quit_menu(){
    log_action "Exti"
    echo "Exiting..."
    exit 0
}

while true;
do
  clear
  menu
  read -p "Enter your choice: " choice

    case "$choice" in

         1) show_date ;;
         2) show_folder ;;
         3) show_file ;;
         4) show_disk ;;
         5) show_memory ;;
         6) run_process ;;
         7) user_info ;;
         8) search_process ;;
         9) ip_address ;;
         10) view_log ;;
         11) clear_log ;;
         12) quit_menu ;;
         *) echo "Inavlid choice. Please enter valid choice" ;;
    esac
   
  pause_action
done  

 