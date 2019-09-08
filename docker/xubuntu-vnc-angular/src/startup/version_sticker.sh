#!/bin/bash
### @accetto, September 2019

ubuntu=$("${STARTUPDIR}/version_of.sh" ubuntu)
node=$("${STARTUPDIR}/version_of.sh" node)
npm=$("${STARTUPDIR}/version_of.sh" npm)
code=$("${STARTUPDIR}/version_of.sh" code)
tsc=$("${STARTUPDIR}/version_of.sh" tsc)
angular=$("${STARTUPDIR}/version_of.sh" angular)
chromium=$("${STARTUPDIR}/version_of.sh" chromium)
firefox=$("${STARTUPDIR}/version_of.sh" firefox)

case "$1" in
    -v)
        echo "Ubuntu $ubuntu"
        echo "Node $node"
        echo "npm $npm"
        echo "VSCode $code"
        echo "TypeScript $tsc"
        echo "Angular $angular"
        [[ -n "$chromium" ]] && echo "Chromium $chromium"
        [[ -n "$firefox" ]] && echo "Firefox $firefox"
        ;;
    -V)
        mousepad=$("${STARTUPDIR}/version_of.sh" mousepad)
        vim=$("${STARTUPDIR}/version_of.sh" vim)
        curl=$("${STARTUPDIR}/version_of.sh" curl)
        git=$("${STARTUPDIR}/version_of.sh" git)
        echo "Ubuntu $ubuntu"
        echo "Mousepad $mousepad"
        echo "VIM $vim"
        echo "curl $curl"
        echo "Git $git"
        echo "Node $node"
        echo "npm $npm"
        echo "VSCode $code"
        echo "TypeScript $tsc"
        echo "Angular $angular"
        [[ -n "$chromium" ]] && echo "Chromium $chromium"
        [[ -n "$firefox" ]] && echo "Firefox $firefox"
        ;;
    *)
        ### example: ubuntu18.04.3-node10.16.3-npm6.9.0-code1.38.0-tsc3.6.2-angular8.3.2
        sticker="ubuntu$ubuntu"-"node$node"-"npm$npm"-"code$code"-"tsc$tsc"-"angular$angular"
        if [[ -n "$firefox" ]] ; then
            ### example: ubuntu18.04.3-node10.16.3-npm6.9.0-code1.38.0-tsc3.6.2-angular8.3.2-firefox69.0
            sticker="$sticker"-"firefox$firefox"
        elif [[ -n "$chromium" ]] ; then
            ### example: ubuntu18.04.3-node10.16.3-npm6.9.0-code1.38.0-tsc3.6.2-angular8.3.2-chromium76.0.3809.100
            sticker="$sticker"-"chromium$chromium"
        fi
        echo "$sticker"
        ;;
esac
