#Function to display the menu
display_menu() {
    printf -- '-------------------------\n'
    echo "Menu Options:"
    echo "Option 1: Deploy to INT02 (172.18.70.42)"
    echo "Option 2: Deploy to DR01 (10.154.12.30)"
    echo "Option 3: Deploy to DR02 (10.154.12.36)"
    echo "Option 4. Exit"
    printf -- '-------------------------\n'
    echo "Please enter your choice:"
}

# Function for Option 1
option1() {
        echo "-----------------------------------------------------------------------------" >> /home/svc_phpadm/sync_detai=s.txt
        echo "Code sync started on $(date)" >> /home/svc_phpadm/sync_details.txt
        rsync --rsync-path 'sudo -u svc_phpadm rsync' -avz  --progress -Oazhb --backup-dir="/var/www/vodacom.4pay.ca/$(date +'%s')" --exclude 'database.php' --filter='- *.log*' --filter='- *.csv*' --filter='- *.gz' --filter='- *.php.*' /var/www/vodacom.4pay.ca/cakephp-2.10.18/ 172.18.70.42:/var/www/vodacom.4pay.ca/cakephp-2.10.18/ >> /home/svc_phpadm/sync_details.txt
        echo "Code sync completed  on $(date)" >> /home/svc_phpadm/sync_details.txt
        echo "-----------------------------------------------------------------------------" >> /home/svc_phpadm/sync_details.txt
        rsync --rsync-path 'sudo -u svc_phpadm rsync' -avz  -q --progress  /home/svc_phpadm/sync_details.txt 172.18.70.42:/home/svc_phpadm/
        echo "Code sync details saved to: /home/svc_phpadm/sync_details.txt"
}


# Function for Option 2
option2() {
    echo "-----------------------------------------------------------------------------" >> /home/svc_phpadm/sync_details.txt
    echo "Code sync started on $(date)" >> /home/svc_phpadm/sync_details.txt
    rsync --rsync-path 'sudo -u svc_phpadm rsync' -avz  --progress -Oazhb --backup-dir="/var/www/vodacom.4pay.ca/$(date +'%s')" --exclude 'database.php' --filter='- *.log*'  --filter='- *.csv*' --filter='- *.gz' --filter='- *.php.*' /var/www/vodacom.4pay.ca/cakephp-2.10.18/ 10.154.12.30:/var/www/vodacom.4pay.ca/cakephp-2.10.18/ >> /home/svc_phpadm/sync_details.txt
    echo "Code sync completed  on $(date)" >> /home/svc_phpadm/sync_details.txt
    echo "-----------------------------------------------------------------------------" >> /home/svc_phpadm/sync_details.txt
    rsync --rsync-path 'sudo -u svc_phpadm rsync' -avz  -q --progress  /home/svc_phpadm/sync_details.txt 10.154.12.30:/home/svc_phpadm/
    echo "Code sync details saved to: /home/svc_phpadm/sync_details.txt"
}

# Function for Option 3
option3() {
   echo "-----------------------------------------------------------------------------" >> /home/svc_phpadm/sync_details.txt
   echo "Code sync started on $(date)" >> /home/svc_phpadm/sync_details.txt
   rsync --rsync-path 'sudo -u svc_phpadm rsync' -avz  --progress -Oazhb --backup-dir="/var/www/vodacom.4pay.ca/$(date +'%s')" --exclude 'database.php' --filter='- *.log*'  --filter='- *.csv*'        --filter='- *.gz' --filter='- *.php.*' /var/www/vodacom.4pay.ca/cakephp-2.10.18/ 10.154.12.36:/var/www/vodacom.4pay.ca/cakephp-2.10.18/ >> /home/svc_phpadm/sync_details.txt
   echo "Code sync completed  on $(date)" >> /home/svc_phpadm/sync_details.txt
   echo "-----------------------------------------------------------------------------" >> /home/svc_phpadm/sync_details.txt
   rsync --rsync-path 'sudo -u svc_phpadm rsync' -avz  -q --progress /home/svc_phpadm/sync_details.txt 10.154.12.36:/home/svc_phpadm/
   echo "Code sync details saved to: /home/svc_phpadm/sync_details.txt"
}


# Main loop for the menu
while true; do
    display_menu
    read choice

    case $choice in
        1)
            option1
            ;;
        2)
            option2
            ;;
        3)
            option3
            ;;
        4)
            echo "Exiting..."
            break
            ;;
        *)
            echo "Invalid option. Please enter a valid option."
            ;;
    esac
done
