#!/bin/bash

Bash.import "$(pwd)/lib/text_display/string.sh"

# author : polygon

sys::urlparser(){
	local url="$1"

   if [[ -z "$url" ]]; then
       return 1
    else
	     __ll__get_code=$(Tulis.strN "$url" | \
	                      grep "/p/" | \
	     				  grep -oP '[/]p[/]\K[^"]+' | \
					      awk -F"[<>]" '{ print $1 }' RS='?' | head -1 | tr -d "/")
	    echo "https://instagram.com/p/${__ll__get_code}?__a=1"
	    return 1
    fi	
    __ll__get=()
}

shopt -s expand_aliases

progres::sys(){

g="\e[1;92m▇\e[00m"
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
    local download="$1"
    
   	for x in $(seq 1 100); do

    sleep 0.1
   	progres::sys ${x} 100
 done

   if curl -s google.com>/dev/null 2>&1; then
       local __ll__url_ig=$(sys::urlparser "$download")

          cek_code=$(
          	curl --silent \
          	     --location \
          	     --request GET \
          	     -H "user-agent: Mozilla/5.0 (Linux; Android 9; TA-1021) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36" https://instagram.com -o /dev/null -w %{http_code} --compressed --insecure
          )

           if [[ $cek_code == 200 ]]; then
              if test -z "$2"; then
                 Tulis.strN "[//] Error argument name not found\n\tsys::code(2,5)\n\t<Argument not found>\n\t<Argument empety>\n[ArgumentError]"
                   exit 2
              fi
                urlparser=$(
                    curl --silent \
                         --request GET \
                         --location \
                         -H "user-agent: Mozilla/5.0 (Linux; Android 9; TA-1021) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.62 Mobile Safari/537.36" \
                         ${__ll__url_ig} --compressed --insecure | \
                         grep '"video_url":' | grep -Eo '"video_url":[^},]*' | grep -oP '"\K[^"]+' | tail +3 | head -1
                         
                )
                  if wget "${urlparser}" -q -O "$2"; then
                   Tulis.strN "[//] Status : Done\n[//] Name : $2\n[//] type : mp4"
                 else
                      curl -sL "$urlparser">$2 || { xdg-open --view "${urlparser}"; } || {
                   	Tulis.strN "[**] Error code(2.2)"
                   	 exit 2
                   }
               else
                   Tulis.strN "[**] Status : {Not found}\n[**] Name : $2\n[**] type : {Not found}
                     exit 1
               fi
           fi
           }
           
alias Bash::mode.dl.ig='main::sys'
alias Bash::download:ig='main::sys'
