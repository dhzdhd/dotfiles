export def setup-editor [ pkg: string ] {
    echo "
    Choose editor
    1) Helix (Default)
    2) Neovim
    3) Emacs
    "
    let choice = input

    let editor = match $choice {
        "1" | "Helix" => "helix"
        "2" | "Neovim" => "neovim"
        "3" | "Emacs" => "emacs"
        _ => "helix"
    }

    run-external sudo $pkg install $editor
}
