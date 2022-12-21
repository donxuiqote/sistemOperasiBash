theExit() {
    clear
    echo -e "\n\n\n            Thank You For Having US ! \n\n"
    echo "      ------------------------------------"
    echo "      |Sistem Operasi B081  | Kelompok 6 |"
    echo "      ------------------------------------"
    echo "      |Endin Rahmanda       | 20081010070|"
    echo "      ------------------------------------"
    echo "      |Rangga Widiasmara    | 21081010085|"
    echo "      ------------------------------------"
    echo "      |Ahmad Nouval Chufaiz | 21081010229|"
    echo "      ------------------------------------"
    echo -e "\n\n\n                Press Enter To Exit !"
    read dummyInput
    exit
}

theNewFolder(){
        clear
        echo "Please Enter the Name of Folder: "
        read name
        { mkdir $name; } && { echo "The folder has been made"; }
        echo -e "\n\n========================================"
        echo "                 Choose"
        echo "========================================"
        echo "1. Create a new folder again"
        echo "2. See What's On Directory"
        echo "3. Go To The Menu List"
        echo "4. Exit"
        echo -e "\nInput Your Choice:"
        read pilihan
        case $pilihan in
            1) theNewFolder;;
            2) clear
                echo -e "\nYour files and folders are shown below : \n"
                ls
                echo -e "\n\n\n========================================\n"
                echo "Press anything to continue"
                read dummyInput
                case $dummyInput in 
                    *) theMenu;;
                    esac;;
            3) theMenu;;
            4) theExit;;
            *) clear
                    echo "======================!!!======================"
                    echo "Option not available, please re-enter your choice !"
                    read dummyInput;
                    theMenu;;      
            esac
}

theNewFile(){
    echo "Input the name of your new .py file   :"
    read text 
    echo "{$text}" > $text.py
    theFilePermission;
}

theChangePermission(){
    echo "write the file's name :"
    read ijinFile
    { sudo chmod +x $ijinFile; } && { echo "The file is now writeable"; }
    echo "Press Anywhere to continue"
    read dummyInput
    theMenu
}

theFilePermission(){
    clear
    echo -e "\n\nFile Permission\n"
    echo "1) Add new file"
    echo "2) Check file's permission"
    echo "3) Change File's Permission"
    echo "4) Back to main menu"
    echo "5) Exit"
    read pilihan
    case $pilihan in
        1) theNewFile;;
        2) clear
            echo "File's name : "
            read fileNya
            ls -l $fileNya
                echo -e "\n\n\n========================================\n"
                echo "Press anything to continue"
                read dummyInput
                theFilePermission;;            
        3) theChangePermission;;
        4) theMenu;;
        5) theExit;;
        *) theFilePermission;;
    esac
}

theRemove(){
    echo "Choose what to remove :"
    echo "1) Remove File"
    echo "2) Remove Folder"
    echo "3) Back To Main Menu"
    read pilihan
    case $pilihan in
        1) clear
            echo "Write file name that you want to remove   :"
            read namaRemove
            { rm $namaRemove; } && { echo "The file is now removed"; }
            echo "Press anywhere to continue"
            read dummyInput
            theRemove;;
        2) clear
            echo "Write folder name that you want to remove   :"
            read namaRemove
            { rmdir $namaRemove; } && { echo "The file is now removed"; }
            echo "Press anywhere to continue"
            read dummyInput
            theRemove;;
        3) theMenu;;
        *) clear 
        theRemove;;
        esac
}

theStopWatch(){  

        Stopwatchs() {
        start=$(date +%s)
        while true; do
            time="$(($(date +%s) - $start))"
            printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        done
        }
        echo "Here You Go !"
        echo "========================================"
        echo "Press enter to record the time"
        echo "Press ctrl + z to excecute the stopwatch"
        echo "========================================"
        Stopwatchs
}

theTimer(){
    echo "input time in second format :"
    read seconds
    start="$(($(date +%s) + $seconds))"
    while [ "$start" -ge `date +%s` ]; do
        time="$(( $start - `date +%s` ))"
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
    done
    echo -e "Your timer for $seconds seconds has done, you'll be directed to the Current Time menu in 5 seconds,\nplease dont press anything"
    sleep 5
    theMenu;
}

theCurrentTime(){
    clear
    echo "Choose your current time format : ";
    echo "1) Show Day, Date, Month, Year"
    echo "2) Show Hour, Minute, Second"
    echo "3) Back To Menu List"
    echo "4) Exit"
    echo
    read waktu;
    case $waktu in
    1) clear
        time=`date +"%A, %d %B %Y"`
        echo "Day, Date, Month, Year : " ${time}
        echo -e "\n\n\n\n\n\n=============================\n1) Back To Menu List\n2) Back To Current Time Menu List\n3) Exit\n"
        echo -e "\nPlease Input Your Choice"
        read kembali;
        case $kembali in
        1) theMenu;;
        2) theCurrentTime;;
        3) exit;;
        esac;;
    2) clear
        time=`date +"%H : %M : %S"`
        echo "It's ${time} O'clock"
        echo -e "\n\n\n\n\n\n=============================\n1) Back To Menu List\n2) Back To Current Time Menu List\n3) Exit\n"
        echo "Please Input Your Choice"
        read kembali;
        case $kembali in
        1) theMenu;;
        2) theCurrentTime;;
        3) exit;;
        esac;;
    3) theMenu;;
    4) clear
        theExit;;
    *) clear
        echo "======================!!!======================"
        echo "Option not available, please re-enter your choice !"
        read dummyInput;
        theCurrentTime;;
    esac
};


theMenu(){
    clear
    echo "============================================"
    echo "                  Menu                      "
    echo "============================================"
    echo "1) Make a new folder (Membuat Folder)"
    echo "2) File Permission (Memanipulasi hak akses)"
    echo "3) Stopwatch"
    echo "4) Timer"
    echo "5) Show Current Time (Mengetahui Waktu Sekarang"
    echo "6) Delete File / Folder"
    echo "7) Exit"
    echo -e "\n\nPlease Input Your Choice   :"
    read menu;
    case $menu in
        1) clear;
            theNewFolder;;
        2) clear;
            theFilePermission;;
        3) clear;
            theStopWatch;;
        4) clear;
            theTimer;;
        5) clear;
            theCurrentTime;;
        6) clear;
            theRemove;;
        7) clear
            theExit;;
        *) clear;
            echo "======================!!!======================"
            echo "Option not available, please re-enter your choice !"
            sleep 3
            theMenu;;
    esac
}
clear
echo -e "\nWelcome to our program !!!\n\n\n\n"
echo "------------------------------------"
echo "|Sistem Operasi B081  | Kelompok 6 |"
echo "------------------------------------"
echo "|Endin Rahmanda       | 20081010070|"
echo "------------------------------------"
echo "|Rangga Widiasmara    | 21081010085|"
echo "------------------------------------"
echo "|Ahmad Nouval Chufaiz | 21081010229|"
echo "------------------------------------"
echo -e "\n\n\nPress Enter To Start !"

read dummyInput
theMenu;
