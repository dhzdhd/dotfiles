# Dotfiles
A collection of necessary dotfiles for editors and other config files

## Usage
* Initial
  * `sudo ... install zsh`
  * `chsh -s $(which zsh)`
  * `sudo ... install neovim`

* Neovim
  * `sudo ... install nodejs npm` for CoC.
  * For vim plug: `sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`
  * `mkdir ~/.config/nvim`
  * `nvim init.vim`
  * Copy and paste content into init.vim


* Kitty:
  * `$ curl -o ~/.config/kitty/nord.conf https://raw.githubusercontent.com/connorholyday/nord-kitty/master/nord.conf` to install nord theme for kitty.
  * `nvim ~/.config/kitty/kitty.conf`
  * Copy and paste content kitty.conf
  

