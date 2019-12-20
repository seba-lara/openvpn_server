#!/bin/bash

if [ "$#" -ne 2 ]; then 
	echo "Uso incorrecto: "
	echo "Uso correcto : ./installer.sh IP_SERVIDOR_LOCAL + IP_VPN"
	exit 1
fi

ARG1=$1
ARG2=$2

echo " 1° Instalar paquetes OPEN-VPN "

sudo yum -y install epel-release wget
sudo yum -y install openvpn

sudo yum install -y cockpit
sudo systemctl enable --now cockpit.socket
sudo firewall-cmd --permanent --zone=public --add-service=cockpit
sudo firewall-cmd --reload

echo " 2° Copiando y creando archivos necesarios "

mkdir	/var/log/openvpn
touch	/etc/sysconfig/iptables
cp	iptables-rules.service /etc/systemd/system/.
cp	uninstall.sh /root/.
cp -r	openvpn/ /etc/.
cp -r	openvpn-ca2/ /root/.

sed -i "s/%%IP_SERVER%%/${ARG1}/g" \
  /etc/openvpn/server.conf

sed -i "s/%%IP_VPN%%/${ARG2}/g" \
  /etc/openvpn/server.conf

echo " 4° Salvando cambios de IPTABLES "

cat iptables > /etc/sysconfig/iptables

echo " 5° Reiniciando servicios y creando enlaces simbolicos "

sudo firewall-cmd --reload
systemctl daemon-reload
systemctl restart firewalld
sleep 5
systemctl enable openvpn@server
systemctl restart openvpn@server
systemctl enable iptables-rules.service
systemctl restart iptables-rules.service

echo " SE RECOMIENDA REINICIAR EL SERVIDOR, SALUDOS "

exit 0
