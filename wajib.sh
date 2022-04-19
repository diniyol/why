#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
  echo "You need to run this script as root"
  exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
  echo "OpenVZ is not supported"
  exit 1
fi
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
IZIN=$( curl https://why-stores.my.id/premium/ip-server.txt | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permission Accepted...${NC}"
else
echo -e "${red}Permission Denied!${NC}";
echo "Please Contact Admin"
echo "Telegram  : t.me/whytzy96"
echo "whatsapp : +62859102641946"
rm -f setup.sh
exit 0
fi
if [ -f "/etc/v2ray/domain" ]; then
echo "Script Already Installed"
exit 0
fi

mkdir /var/lib/premium-script;
echo "IP=" >> /var/lib/premium-script/ipvps.conf

#install ssh ovpn
wget https://why-stores.my.id/premium/script/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
#install ohp-server
wget https://why-stores.my.id/premium/script/ohp-db.sh && chmod +x ohp-db.sh && screen -S ohp-db.sh ./ohp-db.sh
wget https://why-stores.my.id/premium/script/ohp-openvpn.sh && chmod +x ohp-openvpn.sh && screen -S ohp-openvpn.sh ./ohp-openvpn.sh
#sstp
wget https://why-stores.my.id/premium/script/sstp.sh && chmod +x sstp.sh && ./sstp.sh
#install ssr
wget https://why-stores.my.id/premium/script/ssr.sh && chmod +x ssr.sh && ./ssr.sh
#sodosok
wget https://why-stores.my.id/premium/script/sodosok.sh && chmod +x sodosok.sh && ./sodosok.sh
#installwg
wget https://why-stores.my.id/premium/script/wg.sh && chmod +x wg.sh && ./wg.sh
#install L2TP
wget https://why-stores.my.id/premium/script/ipsec.sh && chmod +x ipsec.sh && ./ipsec.sh
#install v2ray
wget https://why-stores.my.id/premium/script/cf.sh && chmod +x cf.sh && ./cf.sh
wget https://why-stores.my.id/premium/script/ins-vt.sh && chmod +x ins-vt.sh && ./ins-vt.sh
#br-set
wget https://why-stores.my.id/premium/script/set-br.sh && chmod +x set-br.sh && ./set-br.sh

# Install websocket
wget https://why-stores.my.id/premium/script/cdn.sh && chmod +x cdn.sh && screen -S cdn.sh ./cdn.sh

# Install Lolcat
wget https://why-stores.my.id/premium/script/lolcat.sh && chmod +x lolcat.sh && ./lolcat.sh

# Set Index
#cd /home/vps/public_html
#wget https://why-stores.my.id/premium/script/index.html
# Encrypt
cd
wget https://why-stores.my.id/premium/script/encrypt.sh && chmod +x encrypt.sh && ./encrypt.sh

rm -f /root/encrypt.sh
rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
rm -f /root/wg.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/ins-vt.sh
rm -f /root/ipsec.sh
rm -f /root/set-br.sh
rm -f /root/ohp.sh
rm -f /root/cdn.sh
rm -f /root/lolcat.sh
rm -f /root/ohp-db.sh
rm -f /root/ohp-openvpn.sh

cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://why-stores.my.id

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
history -c
echo "1.0" > /home/ver
clear
echo " "
sudo hostnamectl set-hostname Dedicted
figlet -c Instalation Success | lolcat
echo " "
echo "--------------------------------------------------------------------------------" | tee -a log-install.txt
echo "================================= Premium Final ===========================" | tee -a log-install.txt
echo "--------------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442, OHP 8087"  | tee -a log-install.txt
echo "   - Stunnel4                : 443, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - WebSocket HTTP          : 2095" | tee -a log-install.txt
echo "   - WebSocket OpenVPN       : 2082" | tee -a log-install.txt
echo "   - WebSocket SSL           : 443" | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
echo "   - PPTP VPN                : 1732"  | tee -a log-install.txt
echo "   - SSTP VPN                : 444"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - V2RAY Vless TLS         : 2083"  | tee -a log-install.txt
echo "   - V2RAY Vless None TLS    : 8880"  | tee -a log-install.txt
echo "   - Trojan                  : 2087"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "--------------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [OFF]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "--------------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Script By               : whytzy96 " | tee -a log-install.txt
echo "   - Telegram                : t.me/whytzy96"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "================================================================================" | tee -a log-install.txt
echo "-------------------------- Created By whytzy96 ---------------------------" | tee -a log-install.txt
echo "================================================================================" | tee -a log-install.txt
echo ""
echo "	 Your VPS Will Be Automatical Reboot In 10 s"
rm -f install.sh
rm -f setup.sh
rm -f wajib.sh
sleep 10
reboot
