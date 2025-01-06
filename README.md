# dotfiles

<!--
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

There is also a [script](https://github.com/JJGO/dotfiles/blob/master/shell-setup.sh) for easy simlinking the dotfiles

<hr>
-->

## Oh my zsh

1. Install oh my zsh

```
yay -S install zsh
chsh -s $(which zsh)
```

> chsh requires password, if you don't have root permission, try this:
> ```
> $ cat ~/.bash_profile
> # User specific environment and startup programs
> export SHELL=/bin/zsh
> exec /bin/zsh -l
> ```

2. reboot and configure with zsh prompt

3. Install oh my zsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

4. Install F-Sy-H

```
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
```

Make sure `fast-syntax-highlighting` has been add to plugin list in `~/.zshrc`.


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
