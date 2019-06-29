# FIREFOX SEND DESKTOP
Upload your files, images, etc to Firefox Send in mode GUI.

### REQUERIMENTS:
```
-Install ffsend pakages: sudo [snap/yum] install ffsend    [OR IN THE STORE: https://linuxappstore.io ]

-SO: Any distribution of Linux

-Have installed Zenity

-Have permission the script: sudo chmod +x "path_of_the_folder"/ffsend-zenity.sh
```


### CAPTURES:

![sdsafs](https://user-images.githubusercontent.com/48721794/60378556-4a720f80-9a24-11e9-9c2e-f826c4ecd90c.PNG)

![qaceB0dCLd](https://user-images.githubusercontent.com/48721794/60378697-84dcac00-9a26-11e9-827d-bf628039f6fe.gif)


### CONFIGURE DIRECT ACCESS ICON DESKTOP:

![sdsafs](https://user-images.githubusercontent.com/48721794/60381620-d3566e80-9a57-11e9-8775-b36ec89d2d03.PNG)

```
1- Edit the file "Ffsend Desktop.dektop":
      Exec > Edit "Exec=path_that_you_put_folder_'Script Ffsend Zenity'/ffsend-zenity.sh"
      Icon > Edit "Exec=path_that_you_put_folder_'Script Ffsend Zenity'/firefoxsend.png"

2-Permission to file "Ffsend Desktop.dektop"
      Open terminal > sudo chmod 755 Ffsend Desktop.dektop
```

### VISIT:

https://github.com/timvisee/ffsend

https://github.com/GNOME/zenity
