#!/bin/bash
### @accetto, September 2019

ubuntu=$("${STARTUPDIR}/version_of.sh" ubuntu)
drawio=$("${STARTUPDIR}/version_of.sh" drawio)
firefox=$("${STARTUPDIR}/version_of.sh" firefox)

case "$1" in
    -v)
        echo "Ubuntu $ubuntu"
        echo "draw.io Desktop $drawio"
        [[ -n "$firefox" ]] && echo "Firefox $firefox"
        ;;
    -V)
        mousepad=$("${STARTUPDIR}/version_of.sh" mousepad)
        screenshooter=$("${STARTUPDIR}/version_of.sh" screenshooter)
        ristretto=$("${STARTUPDIR}/version_of.sh" ristretto)
        vim=$("${STARTUPDIR}/version_of.sh" vim)
        tigervnc=$("${STARTUPDIR}/version_of.sh" tigervnc)
        curl=$("${STARTUPDIR}/version_of.sh" curl)
        git=$("${STARTUPDIR}/version_of.sh" git)
        jq=$("${STARTUPDIR}/version_of.sh" jq)
        echo "Ubuntu $ubuntu"
        echo "VIM $vim"
        echo "TigerVNC $tigervnc"
        echo "Mousepad $mousepad"
        echo "Ristretto $ristretto"
        echo "xfce4-screenshooter $screenshooter"
        echo "curl $curl"
        echo "Git $git"
        echo "jq $jq"
        echo "draw.io Desktop $drawio"
        [[ -n "$firefox" ]] && echo "Firefox $firefox"
        ;;
    *)
        ### example: ubuntu18.04.3-drawio12.2.2
        sticker="ubuntu$ubuntu"-"drawio$drawio"
        if [[ -n "$firefox" ]] ; then
            ### example: ubuntu18.04.3-drawio12.2.2-firefox69.0
            sticker="$sticker"-"firefox$firefox"
        fi
        echo "$sticker"
        ;;
esac
