# ZSH Tmux Byobu environment


config file and repo paths

- Set all to ~/.zsh folder


## Extras: 

`git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions`

`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting`

## Byobu

At `/usr/share/byobu/keybindings` edit common and add these (and remove screens ones):


`source $BYOBU_PREFIX/share/byobu/keybindings/f-keys.tmux.disable`

`source $BYOBU_PREFIX/share/byobu/keybindings/f-keys.tmux`
