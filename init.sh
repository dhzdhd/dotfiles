#!/bin/bash

echo "Setup for desktop(1), WM only desktop(2), server(3)"
read -r home

case "$home" in
1)
    exec stow --target="$HOME" --dir=./configs/linux/ common
    ;;
2)
    echo ""
    ;;
3)
    echo ""
    ;;
*)
    echo "Exiting"
    ;;
esac
