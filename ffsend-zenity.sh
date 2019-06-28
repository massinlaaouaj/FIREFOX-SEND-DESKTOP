#!/bin/bash -x

clear

option="$(zenity --list --title "FFSEND" --text "Select option" --column "List" "Upload" "Download" "History" "Info")"

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
                #echo "$passwordoption";;
                
                #if test "$passwordoption" = "Yes"
                #    then
                #        echo "HH"
                #fi

                #for i in "${files[@]}"; do
                #    echo "$i"
                #done
                
                #echo "${files[*]}"
                

                
                #"$(ffsend upload --verbose temporal.tar.gz)";;
                
    "Download")
                link="$(zenity --title="FFSEND Download" --text URL --entry)"
                
                ffsend download "$link" | xargs -L1 -I % zenity --width=250 --height=250 --info --text=%;;

    "Info") echo "SI";;
esac
