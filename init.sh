#!/bin/bash

echo "Setup for desktop(1), WM only desktop(2), server(3)"
read -r home

echo "Adopt pre-existing config? (y/n)"
read -r adopt

case "$home" in
1)
    if [[ "${adopt}" == "y" ]]; then
        exec stow --adopt --target="$HOME" --dir=./configs/linux/ common
    else
        exec stow --target="$HOME" --dir=./configs/linux/ common
    fi

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
