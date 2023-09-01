#!/bin/bash


QUERY=$(curl -s https://command-not-found.com/"$1" | grep "<code>.*</code>" | sed '/"$1"/d;s/<code>//;s/<\/code>//;/$^/d')
ARCH=$(printf "$QUERY" | grep -P -o -m 1 "pacman .*$")
ALPINE=$(printf "$QUERY" | grep -P -o -m 1 "apk .*$")
REDHAT=$(printf "$QUERY" | grep -P -o -m 1 "yum .*$")
FEDORA=$(printf "$QUERY" | grep -P -o -m 1 "dnf .*$")
DEBIAN=$(printf "$QUERY" | grep -P -o -m 1 "apt-get .*$")
MAC=$(printf "$QUERY" | grep -P -o -m 1 "brew .*$")

[[ $ARCH != "" ]] && {
printf "[\e[34mArch\e[0m]\n"
printf "==> "
echo $ARCH
RET=1
printf "\n"
}

[[ $ALPINE != "" ]] && {
printf "[\e[36mAlpine\e[0m]\n"
printf "==> "
echo $ALPINE
RET=1
printf "\n"
}

[[ $REDHAT != "" ]] && {
printf "[\e[31mRedhat\e[0m]\n"
printf "==> "
echo $REDHAT
RET=1
printf "\n"
}

[[ $FEDORA != "" ]] && {
printf "[\e[31mFedora\e[0m]\n"
printf "==> "
echo $FEDORA
RET=1
printf "\n"
}

[[ $DEBIAN != "" ]] && {
printf "[\e[34mDebian\e[0m]\n"
printf "==> "
echo $DEBIAN
RET=1
printf "\n"
}

[[ $MAC != "" ]] && {
printf "[\e[37mOS X\e[0m]\n"
printf "==> "
echo $MAC
RET=1
printf "\n"
}

[[ $RET == "" ]] && printf "Can't find the package!\n"
