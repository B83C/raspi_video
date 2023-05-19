#!/bin/bash

BASE=/usr/local/bin
RELAY_PIN=17
VPATH=/srv/ftp

if [ "$1" == "-r" ]; then
  sudo rm $BASE/relay.sh
  sudo rm $BASE/videoloop.sh
  sudo rm /etc/cron.d/videoloop
  sudo sed 's/hdmi_drive/#hdmi_drive/' -i /boot/config.txt
  sudo sed 's/write_enable=YES/#write_enable=NO/' -i /etc/vsftpd.conf
  sudo sed 's/\/usr\/sbin\/nologin//' -i /etc/shells
fi

sudo apt install vlc vsftpd screen

sudo systemctl enable --now cron ssh

sudo sed 's/#hdmi_drive/hdmi_drive/' -i /boot/config.txt

sudo sed 's/#write_enable=NO/write_enable=YES/' -i /etc/vsftpd.conf

echo "Enter the password for ftp user"
sudo passwd ftp

sudo chown -R ftp $VPATH
#Hacky
echo "/usr/sbin/nologin" | sudo tee -a /etc/shells > /dev/null

sudo systemctl restart vsftpd

echo "
31 06 * * 1-5 dev /usr/bin/screen -dmS videoloop $BASE/videoloop.sh
31 06 * * 1-5 root $BASE/relay.sh 1
#31 06 * * 1-5 root vcgencmd display_power 1
59 14 * * 1-5 dev /usr/bin/screen -XS videoloop quit
59 14 * * 1-5 root $BASE/relay.sh 0
#59 14 * * 1-5 root vcgencmd display_power 0

@reboot dev /usr/bin/screen -dmS videoloop $BASE/videoloop.sh
@reboot root $BASE/relay.sh 1

#Saturday
01 06 * * 6 dev /usr/bin/screen -dmS videoloop $BASE/videoloop.sh
01 06 * * 6 root $BASE/relay.sh 1
#01 06 * * 6 root vcgencmd display_power 1
59 12 * * 6 dev /usr/bin/screen -XS videoloop quit
59 12 * * 6 root $BASE/relay.sh 0
#59 12 * * 6 root vcgencmd display_power 0
" | sudo tee /etc/cron.d/videoloop > /dev/null

echo \
"#!/bin/bash
# This script plays the videos in the VPATH directory in a loop
if [ \"\$(id -u)\" == \"0\" ];  then
        echo \"Please do not run as admin\"
        exit 1
fi
# Path of the directory containing the videos

startloop () {
        sudo -u dev flock -n /tmp/videoloop.lock vlc -I ncurses --loop $VPATH/
}


# Loop through each file in VPATH
current=\$(date '+%H%M')
(( current=(10#\$current) ))
dow=\$(date '+%u')

if [[ \$dow == [1-5] ]]; then
((current > 630 && current < 1500 )) && startloop;
elif [[ \$dow == 6 ]]; then
((current > 600 && current < 1300 )) && startloop;
fi" | sudo tee $BASE/videoloop.sh > /dev/null

sudo chmod +x $BASE/videoloop.sh

echo "
#!/bin/bash
# This script plays the videos in the VPATH directory in a loop
if [ \"\$(id -u)\" != \"0\" ];  then
        echo \"Please run as admin\"
        exit 1
fi

BASE_GPIO_PATH=/sys/class/gpio

function exportPin()
{
  if [ ! -e \$BASE_GPIO_PATH/gpio\$1 ]; then
    echo \"\$1\" > \$BASE_GPIO_PATH/export
  fi
}

function setOutput()
{
  echo \"out\" > \$BASE_GPIO_PATH/gpio\$1/direction
}

function setGPIOState()
{
  echo \$2 > \$BASE_GPIO_PATH/gpio\$1/value
}

state=\$1
((state ^= 1))

exportPin $RELAY_PIN
setOutput $RELAY_PIN
setGPIOState $RELAY_PIN \$state  
" | sudo tee $BASE/relay.sh > /dev/null

sudo chmod +x $BASE/relay.sh
