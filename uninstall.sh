echo " Desinstalando OpenVPN "

yum -y	erase wget
yum -y	erase openvpn
yum -y	erase epel-release

rm -f /etc/systemd/system/iptables-rules.service
rm -rf /root/openvpn-ca2/
rm -f /etc/sysconfig/iptables
rm -rf /var/log/openvpn
rm -rf /etc/openvpn

systemctl daemon-reload
echo " SE RECOMIENDA REINICIAR EL SERVIDOR "

rm -f /root/uninstall.sh
