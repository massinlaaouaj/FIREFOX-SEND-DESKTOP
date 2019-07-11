#!/bin/bash -x

clear

#Guardar la opción que ha escoguido el usuario
option="$(zenity --list --title "FFSEND" --text "Select option" --column "List" "Upload" "Download" "History" "Info")"

#Case de la variable, que ha guardado la opción escoguida por el usuario
case "$option" in
  
    "Upload")
                directorio="$(zenity --file-selection --multiple --title=Select)"
                
                #Split
                IFS='|' read -ra files <<< "$directorio"
                
                user="$(whoami)"
                
                zenity --question --title "FFSEND" --text "Protect with password?"
                if [[ $? == 0 ]] ; then

                    "$(tar czvf /home/$user/Desktop/temporal.tar.gz --absolute-names ${files[@]})"

                    ffsend upload --password="$(zenity --password)" --archive "/home/$user/Desktop/temporal.tar.gz" | xargs -L1 -I % zenity --width=250 --height=250 --info --text=%

                    zenity --notification --text="Upload complete"
                    
                else
                    
                    "$(tar czvf /home/$user/Desktop/temporal.tar.gz --absolute-names ${files[@]})"

                    ffsend upload "/home/$user/Desktop/temporal.tar.gz" | xargs -L1 -I % zenity --width=250 --height=250 --info --text=%

                    zenity --notification --text="Upload complete"
                
                fi
                
                rm -R /home/$user/Desktop/temporal.tar.gz
                ;;
                
    "Download")
                link="$(zenity --width=500 --title="FFSEND Download" --text URL --entry)"

                exists="$(ffsend exists $link)"

                pass="$(echo "$exists" | tr '\n' ' ')"

                IFS=':' read -ra password_true <<< "$pass"

                if [ "${password_true[2]}" = " true " ];
                then
                    ffsend download --password="$(zenity --password)" "$link" -y
                else
                    ffsend download "$link" -y
                fi
                ;;

    "History")
                history="$(ffsend history)"

                zenity --width=700 --info --text="$history" --ok-label="Clear history"
                if [[ $? == 0 ]] ; then
                    DIRECTORY="/home/$(whoami)/snap/ffsend"
                    echo "$DIRECTORY"
                    if [ -d "$DIRECTORY" ]; 
                    then
                        "$(rm ~/snap/ffsend/26/.cache/ffsend/history.toml)"
                    else
                        "$(rm ~/.cache/ffsend/history.toml)"
                    fi
                else
                    echo "NO"
                fi
                ;;

    "Info")

                zenity --width=700 --info --text="Zenity version: ""$(zenity --version)"" \n \n ""$(ffsend --version)"" \n \n YOUR SYSTEM INFORMATION: \n ""$(hostnamectl)"" "
                ;;
esac
