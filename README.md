##Open-VPN : Open-Virtual Private Network.

*Conectividad punto-a-punto con validación jerárquica de usuarios y host conectados remotamente.*
______________________
####1° Instalar Open-VPN

- Ejecute el instalador mediante el siguiente comando "./installer.sh + IP DEL SERVIDOR LOCAL + IP DEL TUNEL VPN" (sin comillas ni signo "+")
- Terminado el paso anterior se recomienda reiniciar el servidor y revisar si las reglas de iptables fueron restauradas correctamente (iptables-save | grep tun o MASQ)

*IMPORTANTE : La ip asignada a la red del tunel VPN, siempre debe ser la ".0" por ejemplo, x.x.x.0 donde x es un numero entre 1 y 254*
*Se agregará al servidor un servicio Daemon (iptables-rules.service) que ejecuta la restauracion de las reglas de iptables*.

####2° Para crear credenciales

- Ingresar al directorio /root/openvpn-ca2
- Ejecutar "source vars" (sin comillas)
- ./build-key "nombredeusuario" (sin comillas)
- Debe extraer los siguientes archivos que serán propiedad del cliente
    - ca.crt
    - ca.key
    - user.crt
    - user.key
    - ta.key

####3° Para el cliente

- Guardar las credenciales en el directorio /etc/openvpn/client
- En el archivo /etc/openvpn/client.ovpn indicar la ruta de las credenciales
   anteriormente guardadas en el 1° punto del modulo del cliente

####4° Desinstalar Open-VPN

*Se copia un archivo llamado uninstall.sh en el /home del usuario root, quien se encarga de borrar los archivos copiados y desinstalar los paquetes anteriormente instalados cuando le ejecute*
- Ejecute el desinstalador mediante el comando ./uninstall.sh
