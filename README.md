# Raspberry Pi Augmented TV Show player 

## Hardware prerequisites:
- Raspberry Pi
- SD Card
- SD Card Reader

## Preparation
1. OS Installation
- Download the latest Berry OS image here : https://github.com/0rax/BerryOS/releases
  ![image](https://github.com/B83C/raspi_video/assets/72597973/fa578165-98bd-4a53-b8d1-d2521c7ee24e)

- Flash the OS Image using tools like Rufus/Raspberry pi Imager 
  - Rufus: https://rufus.ie/en/
  - Raspberry Pi Imager https://www.raspberrypi.com/software/

2. Configuration
- Download raw configuration files
    [network-config](network-config)
    [user-data](user-data)

- copy both raw files into SD card "boot". 
  *NOTE: raw file without extension

- modify user-data information
  1) hostname
      # ## Set system hostname
      hostname: <raspivideo>   
     *NOTE: current Hostname: raspi1.vid
  2) ...


Step 3: Set up fix IP (refer to huan ling)
- network setting for network access to the RasPi
  *NOTE: set new a record in domain name server : raspi1.vid
- Fix IP: 10.15.11.252
- Port: 3210  ??
- URL: ...


First Boot RasPi
- NOTE: RasPi must have wired internet connection
- Slot in the bootable SD Card into the RasPi
- HDMI connecting the RasPi to TV
- Switch ON the connected Raspi, TV will switch ON automatically (script:??)
- 


*********************************************************

Remote Connetion Configuration
1- FTP to connect
   URL- ftp://raspi1.vid
   Port- 21
   login- username "ftp", password "CHkl19190321"

2- SSH Connect
   URL/IP- ?
   login- username "pi", password "CHkl19190321" 

3- HTTP Connect
   URL- http://raspi1.vid:3210 (not function at my computer?)
   login- username <empty>, password "chkl19190321" 
   - purpose: web interface 其实只能控制视频的播放，和检查视频的播放进程 

*********************************************************

Video list maintenance
- Video file limit: up to 1080p, 4K not supported in this RasPi
- Size Limit?
- video file type
- Video File Location
    folder: /home/ftp
- NOTE: Must REBOOT RasPi upon updating Video files
    - SSH Connect (may use Putty), upon successfully login, 
      type and execute command "sudo reboot".
...


*********************************************************

Video Playing Progress Remote Checking
- Perform SSH Connection to server
- Attach/Detach from running session, "342.videoloop"
- attaching into the session, type command: screen -r
- to detached from the session, press <ctrl> + <a>, then press <d>

*********************************************************

RasPi OS Setting
OS: ?
admin user: ?, password: ?
user: pi, password: CHkl19190321


*********************************************************

RasPi Software Specification
1) FTP server: ProFTPD Server (Debian) 
Video Player: VLC
RDP
Web server 
...


*********************************************************

RasPi Hardware Specification
- Model: ?
- CPU: ?
- Memory: 512MB...
- External storage: SD Card... 
- WIFI? SSID setting?
- Bluetooth?
- Network x1,HDMIx1,USBx3...
- ...

*********************************************************


