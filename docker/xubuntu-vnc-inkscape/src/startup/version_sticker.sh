#!/bin/bash
### @accetto, September 2019

ubuntu=$("${STARTUPDIR}/version_of.sh" ubuntu)
inkscape=$("${STARTUPDIR}/version_of.sh" inkscape)
gimp=$("${STARTUPDIR}/version_of.sh" gimp)
firefox=$("${STARTUPDIR}/version_of.sh" firefox)

case "$1" in
    -v)
        echo "Ubuntu $ubuntu"
        echo "Inkscape $inkscape"
        echo "Gimp $gimp"
        [[ -n "$firefox" ]] && echo "Firefox $firefox"
        ;;
    -V)
        mousepad=$("${STARTUPDIR}/version_of.sh" mousepad)
        vim=$("${STARTUPDIR}/version_of.sh" vim)
        tigervnc=$("${STARTUPDIR}/version_of.sh" tigervnc)
        curl=$("${STARTUPDIR}/version_of.sh" curl)
        git=$("${STARTUPDIR}/version_of.sh" git)
        jq=$("${STARTUPDIR}/version_of.sh" jq)
        echo "Ubuntu $ubuntu"
        echo "Mousepad $mousepad"
        echo "VIM $vim"
        echo "TigerVNC $tigervnc"
        echo "curl $curl"
        echo "Git $git"
        echo "jq $jq"
        echo "Inkscape $inkscape"
        echo "Gimp $gimp"
        [[ -n "$firefox" ]] && echo "Firefox $firefox"
        ;;
    *)
        ### example: ubuntu18.04.3-inkscape0.92.3-gimp2.8.22
        sticker="ubuntu$ubuntu"-"inkscape$inkscape"-"gimp$gimp"
        if [[ -n "$firefox" ]] ; then
            ### example: ubuntu18.04.3-inkscape0.92.3-gimp2.8.22-firefox69.0
            sticker="$sticker"-"firefox$firefox"
        fi
        echo "$sticker"
        ;;
esac
