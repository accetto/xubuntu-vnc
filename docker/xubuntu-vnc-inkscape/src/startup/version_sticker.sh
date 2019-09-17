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
        vim=$("${STARTUPDIR}/version_of.sh" vim)
        tigervnc=$("${STARTUPDIR}/version_of.sh" tigervnc)
        echo "Ubuntu $ubuntu"
        echo "Mousepad $mousepad"
        echo "VIM $vim"
        echo "TigerVNC $tigervnc"
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
