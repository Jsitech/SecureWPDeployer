#!/bin/bash
# SecureWPDeployer - Automated Secure Wordpress Deployer
#Jason Soto
#jason_soto [AT] jsitech [DOT] com
#www.jsitech.com
#Twitter = @JsiTech

# Server Hardening With JackTheStripper
# Wordpress Hardening With WPHardening From Daniel Maldonado @elcodigok


# @license          http://www.gnu.org/licenses/gpl.txt  GNU GPL 3.0
# @author           Jason Soto <jason_soto@jsitech.com>
# @link             http://www.jsitech.com


##############################################################################################################

f_banner(){
echo
echo "
 ____          __        __     ____             _
/ ___|  ___  __\ \      / / __ |  _ \  ___ _ __ | | ___  _   _  ___ _ __
\___ \ / _ \/ __\ \ /\ / / '_ \| | | |/ _ \ '_ \| |/ _ \| | | |/ _ \ '__|
 ___) |  __/ (__ \ V  V /| |_) | |_| |  __/ |_) | | (_) | |_| |  __/ |
|____/ \___|\___| \_/\_/ | .__/|____/ \___| .__/|_|\___/ \__, |\___|_|
                         |_|              |_|            |___/

By Jason Soto "
echo
echo
}

##############################################################################################################


#Check if running with root User

if [ "$USER" != "root" ]; then
      echo "Permission Denied"
      echo "Can only be run by root"
      exit
else
      clear
      f_banner
      echo -e "\e[34m########################################################################\e[00m"
      echo ""
      echo -e "     *** Welcome to the Automated Secure Wordpress Deployer***"
      echo -e "Server Hardening with JackTheStripper <www.jsitech.com/jackthestripper"
      echo -e "Wordpress Hardening with WPHardening <http://www.caceriadespammers.com.ar>"
      echo ""
      echo -e "\e[34m########################################################################\e[00m"
      echo "  "
fi

# Selection Menu
clear
f_banner
echo ""
sleep 2
echo -e "\e[34m--------------------------------------------------------------------------------------------\e[00m"
echo -e "\e[93m[?]\e[00m Choose your Distro"
echo -e "\e[34m--------------------------------------------------------------------------------------------\e[00m"
echo ""
echo " 1. Ubuntu_12.04"
echo " 2. Ubuntu_14.04"
echo " 3. Ubuntu_15.04"
echo " 4. CentOS_6"
echo " 5. CentOS_7"
echo " 6. RHEL_6"
echo " 7. RHEL_7"
echo " 8. Debian_6"
echo " 9. Debian_7"
echo " 10. Debian_8"
echo " 11. Exit"
echo ""
echo -e "\e[34m----------------------------------------------------------------------------------------------\e[00m"
echo ""
echo -ne "\e[93m>\e[00m "
read options

# Using If to run the desired option
if [ "$options" = "1" ]; then
    apt-get install bzr
    apt-get install python-git
    bzr branch lp:jackthestripper
    cd jackthestripper/
    chmod +x dms.sh
    ./dms.sh

elif [ "$options" = "2" ]; then
    apt-get install git
    apt-get install python-git
    git clone https://github.com/Jsitech/JTS-UbuntuServer-14.04LTS
    cd JTS-UbuntuServer-14.04LTS/
    chmod +x dms.sh
    ./dms.sh

elif [ "$options" = "3" ]; then
    apt-get install git
    apt-get install python-git
    git clone https://github.com/Jsitech/JTS-UbuntuServer-15.04LTS
    cd JTS-UbuntuServer-15.04LTS/
    chmod +x dms.sh
    ./dms.sh

elif [ "$options" = "4" ]; then
    yum install git
    yum install GitPython
    git clone https://github.com/Jsitech/JTS-Centos-6
    cd JTS-Centos-6/
    chmod +x dms.sh
    ./dms.sh

elif [ "$options" = "5" ]; then
    yum install git
    yum install GitPython
    git clone https://github.com/Jsitech/JTS-Centos-7
    cd JTS-Centos-7/
    chmod +x Prerun.sh
    chmod +x dms.sh
    sh Prerun.sh
    ./dms.sh

elif [ "$options" = "6" ]; then
    yum install git
    yum install GitPython
    git clone https://github.com/Jsitech/JTS-RHEL-6
    cd JTS-RHEL-6/
    chmod +x dms.sh
    ./dms.sh

elif [ "$options" = "7" ]; then
    yum install git
    yum install GitPython
    git clone https://github.com/Jsitech/JTS-RHEL-7
    cd JTS-RHEL-7/
    chmod +x Prerun.sh
    chmod +x dms.sh
    sh Prerun.sh
    ./dms.sh


elif [ "$options" = "8" ]; then
     apt-get install git
     apt-get install python-git
     git clone https://github.com/Jsitech/JTS-Debian-6
     cd JTS-Debian-6/
     chmod +x dms.sh
     ./dms.sh

elif [ "$options" = "9" ]; then
     apt-get install git
     apt-get install python-git
     git clone https://github.com/Jsitech/JTS-Debian-7
     cd JTS-Debian-7/
     chmod +x dms.sh
     ./dms.sh

elif [ "$options" = "10" ]; then
     apt-get install git
     apt-get install python-git
     git clone https://github.com/Jsitech/JTS-Debian-8
     cd JTS-Debian-8/
     chmod +x dms.sh
     ./dms.sh

elif [ "$options" = "11" ]; then
        echo " You chose $options"
    exit

# If another option is chosen repeat Menu
else
    clear;
    echo "Please select an option"

fi

#Proceed with Wordpress Installation
#Install Wordpress CMS
    clear
    f_banner
    echo ""
    echo -e "\e[93m[-]\e[00m Name the Directory that will hold the Wordpress installation"
    echo ""
    echo -e "\e[34m--------------------------------------------------------------------\e[00m"
    echo -e "\e[93m[?]\e[00m Please type a name for the Directory : "
    echo -e "\e[34m--------------------------------------------------------------------\e[00m"
    echo ""
    echo -ne "\e[93m>\e[00m "
    read DIR
    echo ""
    echo ""
    wget http://wordpress.org/latest.tar.gz
    tar xzvf latest.tar.gz
    mkdir /var/www/html/$DIR
    cp -rf wordpress/* /var/www/html/$DIR/


#Create Wordpress Database
clear
f_banner
echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
echo -e "\e[93m[?]\e[00m Going to Create the Wordpress Database"
echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
echo ""
echo " *** MEMORIZE THE INFO YOU WILL TYPE HERE, WILL NEED IT LATER ***"
echo -n " Type Database Name: "; read db_name
echo -n " Type User:  "; read db_user
echo -n " Type Password:  "; read db_pass
cd ..
chmod +x WPDBcreate.sh
./WPDBcreate.sh $db_name $db_user $db_pass
echo ""
echo ""

#Secure Wordpress Installation with WPHardening from @elcodigok
clear
f_banner
echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
echo -e "\e[93m[?]\e[00m We will now clone the WPHardening Repo tu Secure Wordpress"
echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
echo ""
git clone https://github.com/elcodigok/wphardening.git
cd wphardening/
echo ""
sleep 2
echo ""
echo -e "\e[01;32m[-]\e[00m Securing Wordpress Installation"
echo ""
./wphardening.py -d /var/www/html/$DIR -v -c -r -f -t --wp-config --robots --indexes --plugins
mv /var/www/html/$DIR/wp-config-wphardening.php /var/www/html/$DIR/wp-config.php

#Check Distro Base and Set Permissions
clear
f_banner
echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
echo -e "\e[93m[?]\e[00m Setting Permissions on the Wordpress Directory"
echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
echo ""
ls /usr/bin/dpkg > /dev/null 2>&1
if [ $? -eq 0 ]; then
    chown -R www-data:www-data /var/www/html/$DIR/
    sed -i s/SecRuleEngine\ On/SecRuleEngine\ DetectionOnly/g /etc/modsecurity/modsecurity.conf
else
   rm -f /etc/httpd/conf.d/welcome.conf
   chown -R apache:apache /var/www/html/$DIR/
   sed -i s/SecRuleEngine\ On/SecRuleEngine\ DetectionOnly/g /etc/httpd/conf.d/mod_security.conf
fi

clear
f_banner
echo ""
sleep 2
echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
echo -e "\e[93m[?]\e[00m Deployment finished, Will reboot Server"
echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
echo -e "\e[93m[?]\e[00m After Restarting you can access your Server Remotely via port 372 for Debian Based or 2020 for Red Hat Based Distros"
echo ""
sleep 10
reboot
