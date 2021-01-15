#!/bin/bash
whiptail --title "LİNUX KABUK PROGRAMLAMA PROJE" --msgbox "Batuhan Avcı Linux Kabuk Programlama Proje Ödevine Hoşgeldiniz" 10 100
while true
do
NAME=$(whiptail --inputbox "Adinizi girer misiniz?" 10 100 3>&1 1>&2 2>&3)
kayit= `echo $NAME >> kayit.txt `
echo $NAME
selected_option=$( \
    whiptail \
        --title "SECİM ASAMASİ" \
        --radiolist \
            "HANGİ İSLEMİ YAPMAK İSTERSİNİZ" \
            14 60 6 \
            "1" "1-KAYIT ARAMA" OFF \
            "2" "2-TÜM KAYITLARI GÖSTER" ON \
            "3" "3-KAYIT SİL" OFF \
	    "4" "4-ÇIKIŞ" OFF \
        3>&1 1>&2 2>&3)

case $selected_option in
    1)
	NAME1=$(whiptail --inputbox "Aranacak veriyi girer misiniz?" 10 100 3>&1 1>&2 2>&3)
	echo "ARANACAK_VERİ : $NAME1"
	ARAMA=$( cat kayit.txt | grep -w  "$NAME1" )
	echo "ARAMA : $ARAMA"
	 whiptail --title "KAYIT ARAMA" --msgbox "ARAMA SONUCLARI $ARAMA" 30 100
    ;;
    2)
	whiptail --textbox --title "TÜM KAYITLARI GÖSTER" kayit.txt 30 100 --scrolltext
    ;;
    3)
	input=$(whiptail --inputbox "Silinecek veriyi girer misiniz?" 10 100 3>&1 1>&2 2>&3)
	arama=$( cat kayit.txt | grep -w  "$input" )
	while [ -z "$arama" ]
	do
	 input=$(whiptail --inputbox "Kayıtta bulunan bir veriyi girer misiniz?" 10 100 3>&1 1>&2 2>&3)
	done
	sed -i "/$input/d" kayit.txt
        echo "Kayıt sil"
	whiptail --title "KAYIT SİLME" --msgbox "KAYIT SİLİNDİ : $input" 30 100

    ;;

    4)
	whiptail --yesno "Emin misiniz?" 10 100
	exit
   	echo "ÇIKIŞ" 
    ;;
    *)
        echo "Yanlis secim yapildi"
    ;;
esac
done
