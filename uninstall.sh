echo " 1° Desinstalando OpenVPN "

yum -y erase wget
yum -y erase openvpn
yum -y erase epel-release
yum -y erase iptables-services
yum -y erase cockpit
systemctl restart NetworkManager

rm -rf /etc/systemd/system/reglas.service
rm -rf openvpn-ca2/
rm -rf /etc/sysconfig/iptables
rm -rf /var/log/openvpn
rm -rf /etc/openvpn
rm -rf /tmp/crontab.*
