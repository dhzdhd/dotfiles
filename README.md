# Dotfiles
A collection of necessary dotfiles for editors and other config files

## Usage
* Initial
  * `sudo ... install zsh`
  * `sudo chsh -s $(which zsh)`
  * `sudo ... install neovim`

* Neovim
  * `sudo ... install nodejs npm` for CoC.
  * Download [vim plug](https://github.com/junegunn/vim-plug) 
  * `mkdir ~/.config/nvim`
  * `nvim init.vim`
  * Copy and paste content into `init.vim`
  * Open neovim and type `:PlugInstall`

* Helix
  * `winget install helix`
  * In the editor, type `:config-open`
  * Paste contents of `config.toml` into the opened file and save 

* Windows Terminal (Windows 11)
  * Open settings.json and make a new color scheme called `Nord`:
  
    ```
    {
            "name": "Nord",
            "foreground": "#D8DEE9",
            "background": "#2E3440",
            "black": "#3B4252",
            "red": "#BF616A",
            "green": "#A3BE8C",
            "yellow": "#EBCB8B",
            "blue": "#81A1C1",
            "purple": "#B48EAD",
            "cyan": "#88C0D0",
            "white": "#E5E9F0",
            "brightBlack": "#E5E9F0",
            "brightRed": "#BF616A",
            "brightGreen": "#A3BE8C",
            "brightYellow": "#EBCB8B",
            "brightBlue": "#81A1C1",
            "brightPurple": "#B48EAD",
            "brightCyan": "#88C0D0",
            "brightWhite": "#E5E9F0"
    }
    ```

* Kitty
  * `$ curl -o ~/.config/kitty/nord.conf https://raw.githubusercontent.com/connorholyday/nord-kitty/master/nord.conf` to install nord theme for kitty.
  * `nvim ~/.config/kitty/kitty.conf`
  * Copy and paste content `kitty.conf`
  
* tmux and plugins
  * Make sure that terminal colors are set
  * `sudo ... install tmux`
  * `$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
  * Copy contents of `.tmux.conf` into `~/.tmux.conf`
  * `ctrl B + shift I` to install plugins
  * Reload tmux environment `tmux source ~/.tmux.conf`

## TODO

- Complete Ansible config
- Use https://github.com/microsoft/winget-dsc for winget state config instead of json files