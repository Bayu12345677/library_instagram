#!/bin/bash

: '
     Author : Polygon (Bayu riski)
     Team   : Helixs-crew
     fix    : trap error
'

sys::@file(){
	local __ll__str_arg="$1"

	if [[ ! -f "${__ll__str_arg}" ]]; then
	   echo "[**] Sepertinya tidak ada module $1"
	   exit 1
	 fi

	 source "$1" "$@">/dev/null 2>&1 || {
	 	echo -e "[**] Error\n\t<Source Not found>\n\t<Source no indetifikasi>\n[ErrorSource]> sepertinya library tidak cocok dengan bash"
	 	exit 44
	 }

	 builtin source "$1" "$@"

	 __ll__str_arg=(${__ll__str_arg})
	 return 0
}

shopt -s expand_aliases

Exception::key::sys(){
    echo "
[**] Signal sigint triger

           <Keyboard exit>
           <keyboard Signal SIGINT>
           <Keyboard SIGNAL INT>
           
[KeyboardSignal]"
  exit $?
}

Exception::err(){
	echo -e "[//] ErrorSyntax\n\n\tErrorLine : ${BASH_LINENO}\n\t<Error_Syntax>\n\tErrorSyntax[${BASH_LINENO}]"
}
trap "Exception::key::sys" INT SIGINT
#trap "Exception::err;echo;echo;/data/data/com.termux/files/usr/libexec/termux/command-not-found \"$1\"" ERR

if [[ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]]; then
        command_not_found_handle(){
             Exception::err
            echo -e "\e[91m++++++++++++++++++++++++++++++++\e[00m"
        	/data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
        	  exit $?
        }
fi
alias Bash.import="sys::@file"
alias begin:="set -e; {"
alias __bash__="};"
