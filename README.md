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
  1) Device hostname [(user-data)](user-data?raw=1)
  
    ![image](https://github.com/B83C/raspi_video/assets/72597973/f5e435ce-912a-45e5-992a-e4b5dc8eb002)
    
  2) Password for user pi [(user-data)](user-data?raw=1)

    ![image](https://github.com/B83C/raspi_video/assets/72597973/bc61374a-0805-4d30-8470-bc7f7982aedd)
    
  3) Password for user ftp [(user-data)](user-data?raw=1)

    ![image](https://github.com/B83C/raspi_video/assets/72597973/d53d01da-3eee-44bd-924d-7024991123a9)
    
  4) Password for vlc web interface [(user-data)](user-data?raw=1)

    ![image](https://github.com/B83C/raspi_video/assets/72597973/2e863b24-2063-49d0-b4ed-3969a5c88b77)
  
  5) Modify ssid for wireless connection [(network-config)](network-config?raw=1)

    ![image](https://github.com/B83C/raspi_video/assets/72597973/a3abe186-c236-49e6-a6e0-6517b62ceef9)
     
     
### 3. IP Address / DNS Hostname (Optional)
  - The MAC Address (which is needed for fixed local ip) can be obtained on first boot or via the network admin control panel. (Please refer to someone in the know)

## Initial boot
- It is strongly recommended to use ethernet connection to reduce the hassle when setting up the device.
- Internet connection is *required* to set up the device on initial boot, either **whitelist** the device on wireless connection, or use ethernet to bypass the network restrictions. Should there be any problems, you may reset the initial setup by doing :
  ```sh
  sudo cloud-init clean --logs
  sudo reboot
  ```
  
## Notes
- Video File Location
    folder: /home/ftp
- Default remote connection :
  * ftp : 
    - user : ftp
  * ssh : 
    - user : pi
  * http web-client for vlc
    - url : http://the_ip_of_the_raspi:3210
    - username: < empty >
 - This setup uses VLC for playing videos. Meanwhile, user may control the player via CLI(ncurses)/Web interface.
  * To access the CLI Interface, kindly ssh into the machine then perform `screen -r`. This will attach the current terminal into a GNU Screen session.
  * To exit/detach (without killing) the the gnu screen session and return to the bash terminal, press and hold `\<ctrl\> + a`, then `d`

## Limitations
- Video encoding : 1080p/H.264 encoding (raspberry pi's do not have that much support for other encodings)

## Used software
  - VLC Media player
  - GNU Screen
  - proftpd (FTP server)
  - raspi-gpio
  - cec-utils
  - OliveTin (Web-interface for shell scripts written in Go)
