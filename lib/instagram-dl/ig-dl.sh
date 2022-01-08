#!/bin/bash

Bash.import "$(pwd)/lib/text_display/string.sh"
Bash.import $(pwd)/lib/text_display/colorama.sh

# author : polygon
# sertakan author jika anda ingin mengubah source
# nomor telephone saya : 6285731184377
# updatet : 1.1

sys::urlparser(){
        local url="$1"

   if [[ -z "$url" ]]; then
         exit 2
    else
             __ll__get_code=$(echo "$url" | sed -e 's/?[^},]*/''/g')
#           return 1
    fi
    echo "${__ll__get_code}?__a=1"
}

shopt -s expand_aliases

progres::sys(){
  de=$(default.color)

g="${3}▇${de}"
st="\e[00m"
# proses data nya
        let _progress=(${1}*100/${2}*100)/100
        let _berhasil=(${_progress}*4)/10
        let _kiri=40-$_berhasil

        _timpa=$(Tulis.str "%${_berhasil}s")
        _kosong=$(Tulis.str "%${_kiri}s")

        # buat progress bar menggunakan printf dengan string
        # contoh outpur :
        # downloading : [##########################] 100%

        Tulis.str "\rDownloading : [${_timpa// /${g}}${_kosong// /▓}] ${_progress}%%"
}

shopt -s expand_aliases

main::sys(){
 download="$1"

start=0

    if test "$3" == "color:"; then
               case $4 in
                         red)str=$(mode.bold: merah) ;;
                         green)str=$(mode.bold: hijau) ;;
                         yellow)str=$(mode.bold: kuning) ;;
                         blue)str=$(mode.bold: biru) ;;
                         magenta)str=$(mode.bold: pink) ;;
                         cyan)str=$(mode.bold: cyan) ;;
                         violet)str=$(mode.bold: ungu) ;;
                         white)str=$(mode.bold: putih) ;;
                         *)str=$(mode.bold: hijau) ;;
                         esac
        else
            str=$(mode.bold: hijau)
    fi
for x in $(seq 0 100); do
    sleep 0.1s
    progres::sys ${x} 100 ${str}
done

   if curl -s google.com>/dev/null 2>&1; then
       __ll__url_ig=$(sys::urlparser "$download")

           cek_code=$(
                curl --silent \
                     --location \
                     --request GET \
                     -H "user-agent: Mozilla/5.0 (Linux; Android 9; TA-1021) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36" https://instagram.com -o /dev/null -w %{http_code} --compressed --insecure
          )

           if [[ $cek_code == 200 ]]; then
              if test -z "$2"; then
                 echo "[//] Error argument name not found\n\tsys::code(2,5)\n\t<Argument not found>\n\t<Argument empety>\n[ArgumentError]"
                   exit 2
              fi
                urlparser=$(
                    curl --silent \
                         --request GET \
                         --location \
                         -H "user-agent: Mozilla/5.0 (Linux; Android 9; TA-1021) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36" \
                         "${__ll__url_ig}" --compressed --insecure | grep '"video_url":' | grep -oP '"video_url":"\K[^},]*' | awk -F"[<>]" '{ print $1 }' RS='"' | awk "NF"

                )
                 if wget "$urlparser" -q -O "$2"; then
                   Tulis.strN "[//] Status : Done\n[//] Name : $2\n[//] type : mp4"
                 else
                      curl -sL "$urlparser">$2 || { xdg-open --view "${urlparser}"; } || {
                          Tulis.strN "[**] Error code(2.2)"
                         exit 2
                  }
                   Tulis.strN "[**] Status : {Not found}\n[**] Name : $2\n[**] type : {Not found}"
                     exit 1
               fi
            else
                Tulis.strN "[**] Forbidden"
                  exit $?
              fi
           else
               Tulis.strN "[**] NoConnections"
                 exit $?
           fi
}

alias Bash::mode.dl.ig='main::sys'
alias Bash::download:ig='main::sys'
alias Bash.ig-dl="main::sys"
