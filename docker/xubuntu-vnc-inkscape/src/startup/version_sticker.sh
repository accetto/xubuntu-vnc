#!/bin/bash
### @accetto, September 2019

ubuntu=$("${STARTUPDIR}/version_of.sh" ubuntu)
inkscape=$("${STARTUPDIR}/version_of.sh" inkscape)
firefox=$("${STARTUPDIR}/version_of.sh" firefox)

case "$1" in
    -v)
        echo "Ubuntu $ubuntu"
        echo "Inkscape $inkscape"
        [[ -n "$firefox" ]] && echo "Firefox $firefox"
        ;;
    -V)
        mousepad=$("${STARTUPDIR}/version_of.sh" mousepad)
        screenshooter=$("${STARTUPDIR}/version_of.sh" screenshooter)
        ristretto=$("${STARTUPDIR}/version_of.sh" ristretto)
        vim=$("${STARTUPDIR}/version_of.sh" vim)
        nano=$("${STARTUPDIR}/version_of.sh" nano)
        tigervnc=$("${STARTUPDIR}/version_of.sh" tigervnc)
        curl=$("${STARTUPDIR}/version_of.sh" curl)
        gdebi=$("${STARTUPDIR}/version_of.sh" gdebi)
        git=$("${STARTUPDIR}/version_of.sh" git)
        jq=$("${STARTUPDIR}/version_of.sh" jq)
        echo "Ubuntu $ubuntu"
        echo "VIM $vim"
        echo "GNU nano $nano"
        echo "TigerVNC $tigervnc"
        echo "Mousepad $mousepad"
        echo "Ristretto $ristretto"
        echo "xfce4-screenshooter $screenshooter"
        echo "curl $curl"
        echo "gdebi $gdebi"
        echo "Git $git"
        echo "jq $jq"
        echo "Inkscape $inkscape"
        [[ -n "$firefox" ]] && echo "Firefox $firefox"
        ;;
    *)
        ### example: ubuntu18.04.3-inkscape0.92.3
        sticker="ubuntu$ubuntu"-"inkscape$inkscape"
        if [[ -n "$firefox" ]] ; then
            ### example: ubuntu18.04.3-inkscape0.92.3-firefox69.0
            sticker="$sticker"-"firefox$firefox"
        fi
        echo "$sticker"
        ;;
esac
