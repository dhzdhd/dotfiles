#!/usr/bin/env nu
use "scripts/linbasic.nu" setup-editor

def main [] {
    echo "
    Hello, please choose one of the following subcommands:
    1) windows
    2) linux
    3) linuxwm
    "
}

def "main windows" [] {
    echo "Setup basic stuff? [y/n]"
    let choice = input

    if $choice == "y" {
        run-external winget
    }
}

def "main linux" [] {
    echo "Enter your package manager"
    let pkg = input

    echo "Setup basic stuff? [y/n]"
    let choice = input

    if $choice == "y" {
        setup-helix $pkg
    }
}

def "main linuxwm" [] {

}
