#!/bin/bash

menu(){

    echo "_ _ _MENU_ _ _"
    echo "1.Show Date"
    echo "2.Current Folder"
    echo "3.List Files"
    echo "4.Show Disk Space"
    echo "5.Show Memory Usage"
    echo "6.Show Running process"
    echo "7.Show Current User"
    echo "8.Exit"
}
 
touch log.txt

log_action(){
     echo "User selected $1 at $(date '+%F %T')" >> log.txt
}
pause_menu(){
     read -p "Press Enter to continue..."
}

show_date(){
    date
    log_action  1
    pause_menu
}



current_folder(){
    pwd
    log_action 2
    pause_menu
}



list_files(){
     ls
     log_action 3
     pause_menu
}



disk_space(){
    df -h
    log_action 4
    pause_menu
}



memory(){
    systeminfo | grep "Total Physical Memory"
    systeminfo | grep "Avilable Physical Memory"
    log_action 5
    pause_menu
}



process(){
    ps -f
    log_action 6
    pause_menu
}

user(){
    whoami
    log_action 7
    pause_menu
}



quit_menu(){
    echo "Exiting..."
    exit 0
    log_action 8
    pause_menu
}



while true;
do
    clear
    menu

    read -p "Enter your choice: " choice

    case "$choice" in
     
      1) show_date ;;
      2) current_folder ;;
      3) list_files ;;
      4) disk_space ;;
      5) memory ;;
      6) process ;;
      7) user ;;
      8) quit_menu ;;
      *) echo "invalid option" ;;
    esac
  echo ""
done
