#!/bin/bash
echo -e "Start Downloading Some Required Dependencies.\n"
sudo apt-get update
sudo apt-get install -y curl
sudo apt-get install -y socat
read -p "Please Type Your REAL(more successful)/VITURAL Email, Example, xxxx@gmail.com: " email
echo -e "\n"
read -p "Please Type Your Domain, Example, www.derrity.com: " domain 
echo -e "\n"
echo -e "Now Starting Downloading acme.\n"
git clone https://github.com/acmesh-official/acme.sh.git
./.acme.sh/acme.sh --register-account -m $email
./.acme.sh/acme.sh --issue -d $domain --standalone
./.acme.sh/acme.sh --installcert -d $domain --keyfile /root/private.key --fullchain-file /root/cert.crt
echo -e "Your Key File Is In /root/private.key\n"
echo -e "Your Fullchain File Is In /root/cert.crt\n"
read -p "Do you want to download bbr?(y/n)" choose
if [$choose="y"];then
	echo -e "Starting downloading bbr.\n"
	wget -N --no-check-certificate "https://gist.github.com/zeruns/a0ec603f20d1b86de6a774a8ba27588f/raw/4f9957ae23f5efb2bb7c57a198ae2cffebfb1c56/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
else;then
	echo "Thanks for use."
	exit n
