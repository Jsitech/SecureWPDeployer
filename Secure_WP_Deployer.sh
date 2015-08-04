#!/bin/bash
# JackTheStripper
# Deployer Automatizado para el Despliegue Seguro de Wordpress
# Securización del Servidor con JackTheStripper
# Securización del Wordpress con WPHardening
#
# @license          http://www.gnu.org/licenses/gpl.txt  GNU GPL 3.0
# @author           Jason Soto <jason_soto@jsitech.com>
# @link             http://www.jsitech.com/jackthestripper

clear
echo ""
echo -e "\e[34m########################################################################\e[00m"
echo ""
echo -e "*** Automated Secure Wordpress Deployer - JackTheStripper + WPHardening ***"
echo ""
echo -e "\e[34m########################################################################\e[00m"
echo ""
sleep 3
clear


#Verificar si el Usuario es root
if [ "$USER" != "root" ]; then
      echo "Permiso Denegado"
      echo "Solo puede ser ejecutado por root"
      exit
else
      clear
      echo -e "\e[34m########################################################################\e[00m"
      echo ""
      echo -e "     *** Bienvenidos al Deployer Automatizado de Wordpress***"
      echo -e "Hardening del Server con JackTheStripper <www.jsitech.com/jackthestripper"
      echo -e "Hardening de Wordpress con WPHardening <http://www.caceriadespammers.com.ar>"
      echo ""
      echo -e "\e[34m########################################################################\e[00m"
      echo "  "
fi 

# Menu de Selección
echo ""
sleep 2
echo -e "\e[34m--------------------------------------------------------------------------------------------\e[00m"
echo -e "\e[93m[?]\e[00m Selecciona tu Distribución"
echo -e "\e[34m--------------------------------------------------------------------------------------------\e[00m"
echo ""
echo " 1. Ubuntu_12.04"
echo ""
echo " 2. Ubuntu_14.04"
echo ""
echo " 3. Ubuntu_15.04"
echo ""
echo " 4. CentOS_6"
echo ""
echo " 5. CentOS_7"
echo ""
echo " 6. RHEL_6"
echo ""
echo " 7. RHEL_7"
echo ""
echo " 8. Debian_6"
echo ""
echo " 9. Debian_7"
echo ""
echo " 10. Debian_8"
echo ""
echo " 11. Salir"
echo ""
echo -e "\e[34m----------------------------------------------------------------------------------------------\e[00m"
echo ""
echo -ne "\e[93m>\e[00m "
read options

# Usando if se ejecuta la operación deseada
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
        echo " Seleccionó $options"
    exit

# Si se elije otra opción repetir el menú
else
    clear;
    echo "Por favor seleccione una opción"

fi

#Continuar con la Instalación de Wordpress
#Instalar CMS Wordpress
    echo ""
    echo -e "\e[93m[-]\e[00m Coloque un Nombre al Directorio que alojará Wordpress"
    echo ""
    echo -e "\e[34m--------------------------------------------------------------------\e[00m"
    echo -e "\e[93m[?]\e[00m Como se llamará la Carpeta?"
    echo -e "\e[34m--------------------------------------------------------------------\e[00m"
    echo ""
    echo -ne "\e[93m>\e[00m "
    read CARPETA
    echo ""
    echo ""
    wget http://wordpress.org/latest.tar.gz
    tar xzvf latest.tar.gz
    mkdir /var/www/html/$CARPETA
    cp -rf wordpress/* /var/www/html/$CARPETA/


#Crear Base de Datos Para Wordpress
echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
echo -e "\e[93m[?]\e[00m Crearemos la Base de Datos para Wordpress"
echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
echo ""
echo " *** ANOTE LOS DATOS QUE VA A INGRESAR AQUI, LO NECESITARA MAS ADELANTE ***"
echo -n " Introduzca el Nombre de la Base de Datos: "; read db_name
echo -n " Introduzca el Nombre de Usuario:  "; read db_user
echo -n " Introduzca el Password para el Usuario:  "; read db_pass
cd ..
chmod +x WPDBcreate.sh
./WPDBcreate.sh $db_name $db_user $db_pass
echo ""
echo ""

#Asegurar Instalación de Wordpress con WPHardening de @elcodigok
echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
echo -e "\e[93m[?]\e[00m Se Descargará WPHardening para Securizar esta instalación de Wordpress"
echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
echo ""
git clone https://github.com/elcodigok/wphardening.git
cd wphardening/
echo ""
sleep 2
echo ""
echo -e "\e[01;32m[-]\e[00m Asegurando Instalación de Wordpress"
echo ""
./wphardening.py -d /var/www/html/$CARPETA -v -c -r -f -t --wp-config --delete-version --robots --indexes --plugins
mv /var/www/html/$CARPETA/wp-config-wphardening.php /var/www/html/$CARPETA/wp-config.php

#Determinar Base de Distro y Renombrar Directorio
echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
echo -e "\e[93m[?]\e[00m Se Cambiara los permisos del Directorio de Wordpress"
echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
echo ""
ls /usr/bin/dpkg > /dev/null 2>&1
if [ $? -eq 0 ]; then
    chown -R www-data:www-data /var/www/html/$CARPETA/
    sed -i s/SecRuleEngine\ On/SecRuleEngine\ DetectionOnly/g /etc/modsecurity/modsecurity.conf
else
   rm -f /etc/httpd/conf.d/welcome.conf
   chown -R apache:apache /var/www/html/$CARPETA/
   sed -i s/SecRuleEngine\ On/SecRuleEngine\ DetectionOnly/g /etc/httpd/conf.d/mod_security.conf
fi

echo ""
sleep 2
echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
echo -e "\e[93m[?]\e[00m Despliegue Finalizado, Se procederá a Reiniciar el Servidor"
echo -e "\e[34m---------------------------------------------------------------------------------------------------------\e[00m"
echo -e "\e[93m[?]\e[00m Luego de reiniciado deberá acceder por SSH via el Puerto 372 si es Ubuntu o Debian O 2020 si Es Red Hat o Centos"
echo ""
sleep 10
reboot



