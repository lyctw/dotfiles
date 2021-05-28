1. Set proxy first. (In `.zshrc`)
1. ~~Don't set p10k with unicode, it will cause tmux error.~~
    * Fixed! `vim $HOME/.oh-my-zsh/plugins/tmux/tmux.plugin.zsh`, support unicode in tmux, I can use zsh with the cute icons now :)
    ```
    # Set -u option to support unicode
    ${ZSH_TMUX_UNICODE:=true}
    ```
1. Cannot use symbolic link to update configs, so use `./update.sh` instead.
