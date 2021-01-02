# dotfiles

My configuration files for:

* Bash
* Zsh 
* Git
* Tmux
    * activate [oh-my-zsh tmux plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/tmux), and set `ZSH_TMUX_AUTOSTART` to true.
* Latex
* Vim
    * Use symlink to track the update (must be absolute path): `ln -s ~/Github_repos/dotfiles/vim/vimrc ~/.vimrc`
* ~~Latex includes~~
* ~~Custom scripts~~
* Backups
    * [yomichan](https://chrome.google.com/webstore/detail/yomichan/ogmnaimimemjmbakcfefmnahgdfhfami#:~:text=Yomichan%20turns%20your%20browser%20into,20.12.6.2) Google extension's setting 
    * `.zsh_history`: Use it to access my common command (highly recommend to install [fzf](https://github.com/junegunn/fzf) fuzzy finder)

There is also a [script](https://github.com/JJGO/dotfiles/blob/master/shell-setup.sh) for easy simlinking the dotfiles

<hr>

## Oh my zsh

1. Install oh my zsh

```
sudo apt install zsh
chsh -s $(which zsh)
```

2. reboot and configure with zsh prompt

3. Install oh my zsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

4. Install F-Sy-H

```
git clone https://github.com/zdharma/fast-syntax-highlighting $HOME/.zsh/fast-syntax-highlighting/
```

5. Create `.zshrc` symlink

```
ln -s $(pwd)/.zshrc ~/.zshrc
```

6. Install Powerlevel10k 

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Download and install [MesloLGS NF Regular](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)

7. Download zsh plugins

```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open
```

8. Set the `ZSH_TMUX_AUTOSTART` variable

Modify `$HOME/.oh-my-zsh/plugins/tmux/tmux.plugin.zsh`

```
...
# Automatically start tmux
${ZSH_TMUX_AUTOSTART:=true}
...
```

10. Don't forget apply our changes!

```
source ~/.zshrc
```
