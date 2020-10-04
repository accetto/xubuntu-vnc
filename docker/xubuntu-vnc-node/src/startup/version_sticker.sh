#!/bin/bash
### @accetto, September 2019

ubuntu=$("${STARTUPDIR}/version_of.sh" ubuntu)
node=$("${STARTUPDIR}/version_of.sh" node)
npm=$("${STARTUPDIR}/version_of.sh" npm)
chromium=$("${STARTUPDIR}/version_of.sh" chromium)
firefox=$("${STARTUPDIR}/version_of.sh" firefox)

case "$1" in
    -v)
        echo "Ubuntu $ubuntu"
        echo "Node $node"
        echo "npm $npm"
        [[ -n "$chromium" ]] && echo "Chromium $chromium"
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
        echo "Node $node"
        echo "npm $npm"
        [[ -n "$chromium" ]] && echo "Chromium $chromium"
        [[ -n "$firefox" ]] && echo "Firefox $firefox"
        ;;
    *)
        ### example: ubuntu18.04.3-node10.16.3-npm6.9.0
        sticker="ubuntu$ubuntu"-"node$node"-"npm$npm"
        if [[ -n "$firefox" ]] ; then
            ### example: ubuntu18.04.3-node10.16.3-npm6.9.0-firefox68.0.2
            sticker="$sticker"-"firefox$firefox"
        elif [[ -n "$chromium" ]] ; then
            ### example: ubuntu18.04.3-node10.16.3-npm6.9.0-chromium76.0.3809.100
            sticker="$sticker"-"chromium$chromium"
        fi
        echo "$sticker"
        ;;
esac
