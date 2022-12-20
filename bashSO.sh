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
        mkdir $name
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
    echo "Input your new .txt file   :"
    read text 
    echo "{$text}" > $text.txt
    theFilePermission;
}

theChangePermission(){

}

theFilePermission(){

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
    echo "Your $seconds timer has done, you'll be directed to the Current Time menu in 5 seconds, please dont press anything"
    sleep 5
    theCurrentTime;
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
    echo "5) Mengetahui Current Time"
    echo "6) Exit"
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
        6) clear
            theExit;;
        *) clear;
            echo "======================!!!======================"
            echo "Option not available, please re-enter your choice !"
            sleep 3
            theMenu;;
    esac
}
clear
echo -e "\nWelcome to our program !!!\n\n\n"
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