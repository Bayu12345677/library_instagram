#!/bin/bash

: '
      Author : Polygon
      Team   : Helixs-crew
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

trap "Exception::key::sys" INT SIGINT

alias Bash.import="sys::@file"
