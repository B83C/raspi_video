Setting up RasPi for auto Video Play at TV(USB connection)


Hardware Preparation:
- RasPi with SD Card slot
- SD Card for booting
- SD Card Reader to configure Bootable SD Card.
* NOTE: 
  - For first boot Raspi after Step 2, 
    RasPi must have Wired Ethernet connection 
    and accesible to Internet.


Configure Bootable SD Card 

Step1: OS Installation
- download berryOS
     - URL https://github.com/0rax/BerryOS
     - download from the Release
          BerryOS/arm64: Image berryos-arm64-bullseye-20230117.img.xz
- flash using rufus / raspi imager
     - URL
       https://www.raspberrypi.com/news/raspberry-pi-imager-imaging-utility/
- copy files into SD card "boot". 


Step 2: RasPi Configuration

- Github: b83c (Hengyu account)
     - URL: https://github.com/B83C/raspi_video

- download raw file without extension:
    network-config
    user-data

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


