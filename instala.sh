#!/bin/bash
apt-get install lsof
apt-get install sudo
echo - e "&lt;span data-mce-type="bookmark" style="display: inline-block; width: 0px; overflow: hidden; line-height: 0;" class="mce_SELRES_start"&gt;&lt;/span&gt;root ALL=(ALL) ALL" >> /etc/sudoers
apt-get install figlet -y
apt-get install cowsay -y
echo -e ""
apt-get install lolcat -y
cd $HOME
SCPdir="/etc/newadm"
SCPinstal="$HOME/install"
SCPidioma="${SCPdir}/idioma"
SCPusr="${SCPdir}/ger-user"
SCPfrm="/etc/ger-frm"
SCPfrm3="/etc/adm-lite"
SCPinst="/etc/ger-inst"
rm $HOME/titan.sh
###INTALAR PAQUETES PARA BANER Y AVISOS
msg -bar
apt-get install curl -y &>/dev/null && mm_decho "VERIFICANDO SISTEMA.........[OK]" "0.08" 
apt-get install lsof -y &>/dev/null && mm_decho "BUSCANDO ACTULIZACIONES.....[OK]" "0.08" 
apt-get install sudo -y &>/dev/null && mm_decho "ACTUALIZANDO SISTEMA........[OK]" "0.08" 
apt-get install figlet -y &>/dev/null && mm_decho "INSTALANDO PAQUETES.........[OK]" "0.08" 
apt-get install cowsay -y &>/dev/null 
apt-get install bc -y &>/dev/null   
apt-get install python -y &>/dev/null
SCPresq="aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL3RpdGFuc2VydmVycy9USVRBTl9DTy9tYXN0ZXIvcmVxdWVzdA=="
SUB_DOM='base64 -d'
[[ $(dpkg --get-selections|grep -w "gawk"|head -1) ]] || apt-get install gawk -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "mlocate"|head -1) ]] || apt-get install mlocate -y &>/dev/null
rm $(pwd)/$0 &> /dev/null
msg () {
BRAN='\033[1;37m' && VERMELHO='\e[31m' && VERDE='\e[32m' && AMARELO='\e[33m'
AZUL='\e[34m' && MAGENTA='\e[35m' && MAG='\033[1;36m' &&NEGRITO='\e[1m' && SEMCOR='\e[0m'
 case $1 in
  -ne)cor="${VERMELHO}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";;
  -ama)cor="${AMARELO}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -verm)cor="${AMARELO}${NEGRITO}[!] ${VERMELHO}" && echo -e "${cor}${2}${SEMCOR}";;
  -azu)cor="${MAG}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -verd)cor="${VERDE}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -bra)cor="${BRAN}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";;
  -bar2)cor="\e[0;31m➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖\e[0m" && echo -e "${cor}${SEMCOR}";;
  -bar)cor="${AZUL}${NEGRITO}========================================" && echo -e "${cor}${SEMCOR}";;
 esac
}
fun_ip () {
MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
MIP2=$(wget -qO- ipv4.icanhazip.com)
[[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP"
}
inst_components () {
[[ $(dpkg --get-selections|grep -w "nano"|head -1) ]] || apt-get install nano -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "bc"|head -1) ]] || apt-get install bc -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "screen"|head -1) ]] || apt-get install screen -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "python"|head -1) ]] || apt-get install python -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "python3"|head -1) ]] || apt-get install python3 -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "curl"|head -1) ]] || apt-get install curl -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "ufw"|head -1) ]] || apt-get install ufw -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "unzip"|head -1) ]] || apt-get install unzip -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "zip"|head -1) ]] || apt-get install zip -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "apache2"|head -1) ]] || {
 apt-get install apache2 -y &>/dev/null
 sed -i "s;Listen 80;Listen 81;g" /etc/apache2/ports.conf
 service apache2 restart > /dev/null 2>&1 &
 }
}
funcao_idioma () {
 echo -e " "
msg -bar2
cowsay -f ghostbusters.cow "BIENVENIDO Y GRACIAS POR UTILIZAR VPS-CO TITAN_ORIGIN☁️" | lolcat
figlet ..TITAN.. | lolcat
 echo -e " "
msg -bar2
echo -e "\e[1;33mSelecione Un Idioma\e[0m"
msg -bar2
declare -A idioma=( [1]="en \e[0;37mIngles \e[0m "  [2]="fr \e[0;37mFrances \e[0m "  [3]="de \e[0;37mAleman \e[0m "  [4]="it \e[0;37mItaliano \e[0m "  [5]="pl \e[0;37mPolaco \e[0m "  [6]="pt \e[0;37mPortugues \e[0m "  [7]="es \e[0;37mEspanol \e[0m "  [8]="tr \e[0;37mTurko \e[0m " )
for ((i=1; i<=12; i++)); do
valor1="$(echo ${idioma[$i]}|cut -d' ' -f2)"
[[ -z $valor1 ]] && break
valor1="\033[1;32m[$i] > \033[1;33m$valor1"
    while [[ ${#valor1} -lt 37 ]]; do
       valor1=$valor1" "
    done
echo -ne "$valor1"
let i++
valor2="$(echo ${idioma[$i]}|cut -d' ' -f2)"
[[ -z $valor2 ]] && {
   echo -e " "
   break
   }
valor2="\033[1;32m[$i] > \033[1;33m$valor2"
     while [[ ${#valor2} -lt 37 ]]; do
        valor2=$valor2" "
     done
echo -ne "$valor2"
let i++
valor3="$(echo ${idioma[$i]}|cut -d' ' -f2)"
[[ -z $valor3 ]] && {
   echo -e " "
   break
   }
valor3="\033[1;32m[$i] > \033[1;33m$valor3"
     while [[ ${#valor3} -lt 37 ]]; do
        valor3=$valor3" "
     done
echo -e "$valor3"
done
msg -bar2
unset selection
while [[ ${selection} != @([1-8]) ]]; do
echo -ne "\033[1;37mSELECIONE: " && read selection
tput cuu1 && tput dl1
done
pv="$(echo ${idioma[$selection]}|cut -d' ' -f1)"
[[ ${#id} -gt 2 ]] && id="pt" || id="$pv"
byinst="true"
}
install_fim () {
msg -ama "$(source trans -b es:${id} "Instalación completa, utilice los comandos"|sed -e 's/[^a-z -]//ig')" && msg bar2
echo -e " menu / adm" && msg -verm "$(source trans -b pt:${id} "Reinicie su servidor para completar la instalación"|sed -e 's/[^a-z -]//ig')"
mkdir /etc/crondbl  > /dev/null 2>&1 
mkdir /etc/rom  > /dev/null 2>&1
mkdir /etc/bin  > /dev/null 2>&1
mkdir /etc/nanobc  > /dev/null 2>&1
msg -bar2
}
ofus () {
unset txtofus
number=$(expr length $1)
for((i=1; i<$number+1; i++)); do
txt[$i]=$(echo "$1" | cut -b $i)
case ${txt[$i]} in
".")txt[$i]="+";;
"+")txt[$i]=".";;
"1")txt[$i]="@";;
"@")txt[$i]="1";;
"2")txt[$i]="?";;
"?")txt[$i]="2";;
"3")txt[$i]="%";;
"%")txt[$i]="3";;
"/")txt[$i]="K";;
"K")txt[$i]="/";;
esac
txtofus+="${txt[$i]}"
done
echo "$txtofus" | rev
}
verificar_arq () {
[[ ! -d ${SCPdir} ]] && mkdir ${SCPdir}
[[ ! -d ${SCPusr} ]] && mkdir ${SCPusr}
[[ ! -d ${SCPfrm} ]] && mkdir ${SCPfrm}
[[ ! -d ${SCPinst} ]] && mkdir ${SCPinst}
[[ ! -d ${SCPfrm3} ]] && mkdir ${SCPfrm3}
case $1 in
"menu"|"message.txt")ARQ="${SCPdir}/";; #Menu
"dados.zip")ARQ="${SCPfrm3}/";; #painel
"painel.zip")ARQ="${SCPfrm3}/";; #painel
"usercodes")ARQ="${SCPusr}/";; #User
"openssh.sh")ARQ="${SCPinst}/";; #Instalacao
"squid.sh")ARQ="${SCPinst}/";; #Instalacao
"dropbear.sh")ARQ="${SCPinst}/";; #Instalacao
"openvpn.sh")ARQ="${SCPinst}/";; #Instalacao
"ssl.sh")ARQ="${SCPinst}/";; #Instalacao
"ssld.sh")ARQ="${SCPinst}/";; #Instalacao
"sslmanager.sh")ARQ="${SCPinst}/";; #Instalacao
"errormanager.sh")ARQ="${SCPinst}/";; #Instalacao
"shadown.sh")ARQ="${SCPinst}/";; #Instalacao
"shadowsock.sh")ARQ="${SCPinst}/";; #Instalacao
"shadowsocks.sh")ARQ="${SCPinst}/";; #Instalacao
"shadown.sh")ARQ="${SCPinst}/";; #Instalacao
"ssrrmu.sh")ARQ="${SCPinst}/";; #Instalacao
"shadowsocks.sh")ARQ="${SCPinst}/";; #Instalacao
"v2ray.sh")ARQ="${SCPinst}/";; #Instalacao
"vdoray.sh")ARQ="${SCPinst}/";; #Instalacao
"sockspy.sh"|"PDirect.py"|"PPub.py"|"PPriv.py"|"POpen.py"|"PGet.py")ARQ="${SCPinst}/";; #Instalacao
*)ARQ="${SCPfrm}/";; #Ferramentas
esac
mv -f ${SCPinstal}/$1 ${ARQ}/$1
chmod +x ${ARQ}/$1
}
fun_ip
wget -O /usr/bin/trans https://raw.githubusercontent.com/titanservers/vpsco/master/Install/trans &> /dev/null
msg -bar2
msg -ama "[ NEW - ULTIMATE - SCRIPT ] ➣ \033[1;33m[\033[1;34m OFICIAL BY-DANKELTHAHER \033[1;33m]"
[[ $1 = "" ]] && funcao_idioma || {
[[ ${#1} -gt 2 ]] && funcao_idioma || id="$1"
 }
Key="qra-atsilK0@84%ab97cda8f?K8888:8@@+95+84?+94@"
REQUEST=$(echo $SCPresq|$SUB_DOM)
IP="104.238.135.147" && echo "$IP" > /usr/bin/vendor_code
cd $HOME
msg -ne "Key: "
wget -O $HOME/lista-arq ${REQUEST}/lista-arq > /dev/null 2>&1 && echo -e "\033[1;32m Verified" || {
   echo -e "\033[1;32m Verified"
   invalid_key
   exit
   }
sleep 1s
updatedb
if [[ -e $HOME/lista-arq ]] && [[ ! $(cat $HOME/lista-arq|grep "KEY INVALIDA!") ]]; then
   msg -bar2
   msg -ama "$(source trans -b pt:${id} "BEM VINDO, OBRIGADO POR UTILIZAR"|sed -e 's/[^a-z -]//ig'): \033[1;31m[NEW-ULTIMATE]"
   [[ ! -d ${SCPinstal} ]] && mkdir ${SCPinstal}
   pontos="."
   stopping="$(source trans -b pt:${id} "Verificando Atualizacoes"|sed -e 's/[^a-z -]//ig')"
   for arqx in $(cat $HOME/lista-arq); do
   msg -verm "${stopping}${pontos}"
   wget -O ${SCPinstal}/${arqx} ${REQUEST}/${arqx} > /dev/null 2>&1 && verificar_arq "${arqx}" || error_fun
   tput cuu1 && tput dl1
   pontos+="."
   done
   sleep 1s
   msg -bar2
   listaarqs="$(locate "lista-arq"|head -1)" && [[ -e ${listaarqs} ]] && rm $listaarqs   
   cat /etc/bash.bashrc|grep -v '[[ $UID != 0 ]] && TMOUT=15 && export TMOUT' > /etc/bash.bashrc.2
   echo -e '[[ $UID != 0 ]] && TMOUT=15 && export TMOUT' >> /etc/bash.bashrc.2
   mv -f /etc/bash.bashrc.2 /etc/bash.bashrc
   echo "${SCPdir}/menu" > /usr/bin/menu && chmod +x /usr/bin/menu
   echo "${SCPdir}/menu" > /usr/bin/adm && chmod +x /usr/bin/adm
   inst_components
   echo "$Key" > ${SCPdir}/key.txt
   [[ -d ${SCPinstal} ]] && rm -rf ${SCPinstal}   
   [[ ${#id} -gt 2 ]] && echo "pt" > ${SCPidioma} || echo "${id}" > ${SCPidioma}
   [[ ${byinst} = "true" ]] && install_fim
else
invalid_key
fi
