#!/bin/bash

cat /home/oem/BARO/AStool/logo3.txt
# printf "Wellcome BARO AS Tool"
# printf "\\n"
# printf "\\n"
printf "This program diagnoses posidon"
printf "The results are delivered to the BARO Engineer."
printf "\\n"
printf "\\n"
printf "To continue the AS tool, please review the provision"
printf "\\n"
printf "\\n"
printf "please press enter to continue\\n"
printf " >>> "
read -r tmp

cat /home/oem/BARO/AStool/data.txt |more

printf "Do you agree to to collect and use personal information?? [no/yse]\\n"
printf "[no] >>> "

read -r agree

if [ "$agree" != "yes" ] && [ "$agree" != "Yes" ] && [ "$agree" != "YES" ]
 then
 echo "You have to agree the provision"
 printf "please press enter to close\\n"
 printf "[enter]"
 read -r tmp
else
 clear
 printf "What is your name \\n"
 printf "\e[7mName\e[0m :"
 read -r name
 printf "\\n"
 #echo $name
 printf "What is your company name\\n"
 printf "\e[7mCompany Name\e[0m :"
 read -r cname
 printf "\\n"
 #echo $cname
 printf "What is your E-mail\\n"
 printf "\e[7mE-mail\e[0m :"
 read -r email
 printf "\\n"
 #echo $email
 printf "What is your phone number\\n"
 printf "\e[7mPhone number\e[0m :"
 read -r phone
 printf "\\n"
 account=`whoami`
 printf "Your poseidon account password\\n"
 printf "[$account password] : "
 read -r password 
#  echo $password
 echo $password | sudo -S chmod 644 /var/log/syslog
 
 filedate=$(date +%y%m%d)_$(date +%H%M)
 /home/oem/BARO/AStool/systemcheck.sh > /home/oem/BARO/ASresult/Poseidon_"$filedate"_log.temp
#  zip /home/oem/BARO/ASresult/Poseidon_"$filedate"_log.zip /home/oem/BARO/ASresult/Poseidon_"$filedate"_log.txt
 
 touch /home/oem/BARO/ASresult/Poseidon_"$filedate"_log.txt

 echo 'Name : ' $name > /home/oem/BARO/ASresult/Poseidon_"$filedate"_log.txt
 echo 'Company : ' $cname >> /home/oem/BARO/ASresult/Poseidon_"$filedate"_log.txt
 echo 'E-mail : ' $email >> /home/oem/BARO/ASresult/Poseidon_"$filedate"_log.txt
 echo 'Phone number : ' $phone >> /home/oem/BARO/ASresult/Poseidon_"$filedate"_log.txt
 cat /home/oem/BARO/ASresult/Poseidon_"$filedate"_log.txt > /home/oem/BARO/ASresult/Poseidon_"$filedate"_main.txt

 cat /home/oem/BARO/ASresult/Poseidon_"$filedate"_log.temp >> /home/oem/BARO/ASresult/Poseidon_"$filedate"_log.txt
 
 zip -j /home/oem/BARO/ASresult/Poseidon_"$filedate"_log.zip /home/oem/BARO/ASresult/Poseidon_"$filedate"_log.txt

 cat /home/oem/BARO/ASresult/Poseidon_"$filedate"_main.txt | mail -s "AS_$cname-$name" support@baroai.com --attach=/home/oem/BARO/ASresult/Poseidon_"$filedate"_log.zip
 
 rm /home/oem/BARO/ASresult/Poseidon_"$filedate"_log.zip
 rm /home/oem/BARO/ASresult/Poseidon_"$filedate"_log.temp

 printf ""
 printf ""
 clear
 printf "\\n"
 echo -e "\033[1mProcess all Done !!!\033[0m"
 printf "\\n"
 echo 'Logfile will locate under /home/oem/BARO/ASresult/'
 printf "\\n"
 echo 'AS team will check your poseidon'
 printf "\\n"
 printf "please press enter to close\\n"
 printf "[enter]"
 read -r tmp
 
 
fi




