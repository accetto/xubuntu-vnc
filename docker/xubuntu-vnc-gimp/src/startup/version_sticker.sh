#!/bin/bash
### @accetto, September 2019

ubuntu=$("${STARTUPDIR}/version_of.sh" ubuntu)
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
        echo "TigerVNC $tigervnc"
        echo "GNU nano $nano"
        echo "Mousepad $mousepad"
        echo "Ristretto $ristretto"
        echo "xfce4-screenshooter $screenshooter"
        echo "curl $curl"
        echo "gdebi $gdebi"
        echo "Git $git"
        echo "jq $jq"
        echo "Gimp $gimp"
        [[ -n "$firefox" ]] && echo "Firefox $firefox"
        ;;
    *)
        ### example: ubuntu18.04.3-gimp2.8.22
        sticker="ubuntu$ubuntu"-"gimp$gimp"
        if [[ -n "$firefox" ]] ; then
            ### example: ubuntu18.04.3-gimp2.8.22-firefox69.0
            sticker="$sticker"-"firefox$firefox"
        fi
        echo "$sticker"
        ;;
esac
