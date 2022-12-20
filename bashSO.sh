#theNewFolder(){}
#theFilePermission(){}
theStopWatch(){  

        Stopwatchs() {
        while true; do
            printf '%s\r' "$(date +%H:%M:%S)"
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
    echo "Your $seconds timer has done, you'll be directed to the Current Time menu in 10 seconds"
    sleep 10
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
        exit;;
    *) clear
        echo "======================!!!======================"
        echo "Option not available, please re-enter your choice !"
        read dummyInput;
        theCurrentTime;;
    esac
};


theMenu(){
    clear
    echo "Menu"
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
            echo "Good Bye!!!"
            echo "Kelompok 6"
            echo "Endin Rahmanda - 20081010070"
            echo "Endin Rahmanda - 20081010070"
            echo "Endin Rahmanda - 20081010070"
            echo "Press Anywhere To Exit !"
            read dummyInput;
            exit;;
        *) clear;
            echo "======================!!!======================"
            echo "Option not available, please re-enter your choice !"
            read dummyInput;
            theMenu;;
    esac
}
clear
echo -e "\nWelcome to our program !!!\n\n\n"
echo "Sistem Operasi B081 - Kelompok 6"
echo "Endin Rahmanda - 20081010070"
echo "Endin Rahmanda - 20081010070"
echo "Endin Rahmanda - 20081010070"
echo -e "\n\n\nPress Anywhere To Start !"

read dummyInput
theMenu;
