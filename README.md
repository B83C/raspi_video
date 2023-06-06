# Raspberry Pi Augmented TV Show player 

## Hardware prerequisites:
- Raspberry Pi
- SD Card
- SD Card Reader

## Preparation
### 1. OS Installation

- Download the latest Berry OS image here : https://github.com/0rax/BerryOS/releases
  ![image](https://github.com/B83C/raspi_video/assets/72597973/fa578165-98bd-4a53-b8d1-d2521c7ee24e)

- Flash the OS Image using tools like Rufus/Raspberry pi Imager 
  - Rufus: https://rufus.ie/en/
  - Raspberry Pi Imager https://www.raspberrypi.com/software/

### 2. Configuration

- Download raw configuration files into the "boot" partition ( or detected as "boot" drive on Windows) of the SD Card. **Remember to save the files raw without any extension**
  * [network-config](network-config?raw=1)
  * [user-data](user-data?raw=1)
 
- Modify the contents of user-data as needed
  1) Device hostname
  
    ![image](https://github.com/B83C/raspi_video/assets/72597973/bdee83b5-50ef-4f94-bde7-ad8b4a0ac2f9)
    
  2) Password for user pi

    ![image](https://github.com/B83C/raspi_video/assets/72597973/6326770f-8cc9-4637-821d-89cc66e6020c)
    
  3) Password for vlc web interface

    ![image](https://github.com/B83C/raspi_video/assets/72597973/a61468cb-a0ea-485e-b63b-12c51db3cc13)
    

### 3. IP Address / DNS Hostname (Optional)
  - The MAC Address (which is needed for fixed local ip) can be obtained on first boot or via the network admin control panel. (Please refer to someone in the know)

## Initial boot
- As per [network-config](network-config?raw=1), the default wireless SSID has been set to CHKLWIFI, meaning it should connect automatically to CHKLWIFI on boot.
- It is much recommended to use ethernet connection to reduce the hassle when setting up the device.
- Internet connection is *required* to set up the device on initial boot, either **whitelist** the device on wireless connection, or use ethernet to bypass the network restrictions. Should there be any problems, you may reset the initial setup by doing :
  ```sh
  sudo cloud-init clean --logs
  sudo reboot
  ```
- After the setup succeeded, kindly log in to pi/root user and change the password of the ftp user : 
  ```sh
  sudo passwd ftp
  ```
  
## Notes
- Default remote connection :
  * ftp : 
    - user : ftp
  * ssh : 
    - user : pi
  * http web-client for vlc
    - url : http://the_ip_of_the_raspi:3210
    - username: < empty >
 - This setup uses VLC for playing videos. Meanwhile, the vlc is set up to interact with user control via CLI(ncurses)/Web interface.
  * To access the CLI Interface, kindly ssh into the machine and perform `screen -r`. This will attach the current terminal into a GNU Screen session.
  * To exit the the gnu screen session and return to the bash terminal, press and hold `\<ctrl\> + a`, then `d`

## Limitations
- Video encoding : 1080p/H.264 encoding (raspberry pi's do not have that much support for other encodings)
- Video File Location
    folder: /home/ftp
- VLC may or may not update the playlist automatically, if uncertain, perform a reboot for new video entries to show up.
  * You may reboot by performing `sudo reboot` via ssh.
  
## Used software
  - VLC Media player
  - GNU Screen
  - proftpd (Ftp server)
  - raspi-gpio
  - cec-utils
