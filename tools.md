* Ubuntu Config 
    * Bluetooth
        * https://dev-pages.info/ubuntu-bluetooth/
    * Change theme
        *  https://itsfoss.com/install-themes-ubuntu/
        * https://itsfoss.com/ubuntu-mate-customization/
        * https://www.youtube.com/watch?v=AHzGYG2XvMI
    * Useful tools
         1. Shell Tools and Scripting
            * fd, ripgrep, bat, [fzf](https://github.com/junegunn/fzf#using-git)
            * tldr (use npm or pip)
         2. Command-line Environment
            * [tmux](https://github.com/gpakosz/.tmux)
         3. [Debugging and Profiling](https://missing.csail.mit.edu/2020/debugging-profiling/)
            * [lnav](lnav.org)
            * [ipdb](https://pypi.org/project/ipdb/)
            * [gdb](https://www.gnu.org/software/gdb/), [pwndbg](https://github.com/pwndbg/pwndbg) 
            * [write-good](https://github.com/btford/write-good)
            * [pycallgraph](pycallgraph.slowchop.com/en/master/)
            * perf
               * Use `sudo perf stat <command>` to check the cpu utilization, context switch and page faults of and program execution
            * [FlameGraph](https://github.com/brendangregg/FlameGraph)
         4. Potpourri
            * [jq](https://stedolan.github.io/jq/)
            *  translate-shell, sdcv (dictionary: [here](https://askubuntu.com/questions/191125/is-there-an-offline-command-line-dictionary))
            * File transfer: [croc](https://github.com/schollz/croc) 
            * Command line slides: [mdp](https://github.com/visit1985/mdp)
            * RSS Reader: [newsboat](https://github.com/newsboat/newsboat)
    * 自訂終端機
        * 安裝zsh
          https://www.youtube.com/watch?v=4KBuPCeF9Gc
            1. `sudo apt install zsh`
            2. `chsh -s $(which zsh)`
            3. reboot
            4. 重開後自動跳對話框，選(2)  Populate your ~/.zshrc with the configuration recommended
            5. `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
            6. `vim ~/.zshrc`
                 * ~~改主題 `ZSH_THEME="agnoster"~~
                 * 改主題 `ZSH_THEME="powerlevel10k/powerlevel10k"`
                    * install [powerlevel10k](https://github.com/romkatv/powerlevel10k#oh-my-zsh)
                    * Download and install [MesloLGS NF Regular](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)
                    * [CharMap](https://char-map.herokuapp.com/)可以讀取ttf檔找特殊字元
                 * 改 `plugins=(git colored-man-pages zsh-autosuggestions git-open tmux)`
            7. `cd ~/.oh-my-zsh/custom/plugins` 
                 * 下載 `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
                 * `git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open`
                 * colored-man-pages 是內建的不需另外載
                 * `source ~/.zshrc` 就能讀到plugins了
        * VS Code Zsh設定
            * [在 Visual Studio Code Terminal 中使用 Oh-My-Zsh](https://medium.com/@wifferlin0505/在-visual-studio-code-terminal-中使用-oh-my-zsh-799cb106df75) 
            * [How to edit settings.json in Visual Studio Code?](https://supunkavinda.blog/vscode-editing-settings-json)
            * Font family預設Consolas, 'Courier New', monospace 改成~~[Ubuntu Mono derivative powerline](https://github.com/powerline/fonts/tree/master/UbuntuMono)~~ [Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack/Regular/complete) 就能有特殊字元
    * Gnome Online Account (存取google drive)
        * [How to Access your Google Drive Account in Ubuntu 18.04 LTS](https://vitux.com/how-to-access-your-google-drive-account-in-ubuntu/)
        * [Missing settings in GNOME control center installed in Ubuntu MATE](https://askubuntu.com/questions/1005753/missing-settings-in-gnome-control-center-installed-in-ubuntu-mate)
    * NodeJS
        * 官方: [How to install nodejs via binary archive on Linux](https://github.com/nodejs/help/wiki/Installation#how-to-install-nodejs-via-binary-archive-on-linux)
        * [Install NodeJS via binary archive on Ubuntu 18.04](https://medium.com/@rabbi.cse.sust.bd/install-nodejs-via-binary-archive-on-ubuntu-18-04-63118473d9e9)
        * Symlink `node`, `npm` for `sudo` commands
            * `sudo ln -s $(where npm) /usr/bin/npm`  
            * `sudo ln -s $(where node) /usr/bin/node`  
    * ~~[Visual Studio Code Remote Development through SSH](https://www.youtube.com/watch?v=lKXMyln_5q4)~~
    * ~~Windows Subsystem for Linux~~
        * [Windows Subsystem for Linux (WSL)](https://hackmd.io/@billsun/Bkh8oAmGX?type=view)
    * Music Software
        * Ubuntu JACK 連接設定 
            * http://puredata.info/docs/JackRoutingMultichannelAndBrowserAudio/
        * Sonic Visualiser
            * Install [Chordino](https://www.vamp-plugins.org/download.html)
            * 下面有安裝教學 創一個vamp資料夾  把.so檔丟進去
    * Git
        * Tips for git hooks
            * use absolute path for symlink
            * Set permission by `chmod u+x` on hook scripts
