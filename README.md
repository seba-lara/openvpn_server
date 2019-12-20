<h2>Open-VPN : Open-Virtual Private Network.</h2>

*Conectividad punto-a-punto con validación jerárquica de usuarios y host conectados remotamente.*
______________________
<h4>1° Instalar Open-VPN</h4>

- Ejecute el instalador mediante el siguiente comando "./installer.sh + IP DEL SERVIDOR LOCAL + IP DEL TUNEL VPN" (sin comillas ni signo "+")
- Terminado el paso anterior se recomienda reiniciar el servidor y revisar si las reglas de iptables fueron restauradas correctamente (iptables-save | grep tun o MASQ)

*Se agregará al servidor un servicio Daemon (iptables-rules.service) que ejecuta la restauracion de las reglas de iptables*.

<h4>2° Para crear credenciales</h4>

- Ingresar al directorio /root/openvpn-ca2
- Ejecutar "source vars" (sin comillas)
- ./build-key "nombredeusuario" (sin comillas)
- Debe extraer los siguientes archivos que serán propiedad del cliente
  * ca.crt
  * ca.key
  * user.crt
  * user.key
  * ta.key

<h4>3° Para el cliente</h4>

- Guardar las credenciales en el directorio /etc/openvpn/client
- En el archivo /etc/openvpn/client.ovpn indicar la ruta de las credenciales
   anteriormente guardadas en el 1° punto del modulo del cliente

<h4>4° Desinstalar Open-VPN</h4>

*Se copia un archivo llamado uninstall.sh en el /home del usuario root, quien se encarga de borrar los archivos copiados y desinstalar los paquetes anteriormente instalados cuando le ejecute*
- Ejecute el desinstalador mediante el comando ./uninstall.sh
