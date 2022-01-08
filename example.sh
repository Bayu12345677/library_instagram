#!/bin/bash

source $(pwd)/lib/moduler.sh

Bash.import $(pwd)/lib/instagram-dl/ig-dl.sh


read -p "[url_ig]>> " re
read -p "[name_output]>> " up
read -p "[color]> " color
echo

Bash.ig-dl $re $up color: $color
