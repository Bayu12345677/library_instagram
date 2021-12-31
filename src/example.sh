#!/bin/bash

source "$(pwd)"/../lib/moduler.sh

Bash.import "$(pwd)/../lib/text_display/string.sh"
Bash.import "$(pwd)/../lib/instagram-dl/ig-dl.sh"

Tulis.strN "Instagram downloader"
Tulis.str "[url video]> "
read __ll__local_url
Tulis.str "[nama video]> "
read __ll__local_nama

Bash::mode.dl.ig "${__ll__local_url}" "${__ll__local_nama}"
