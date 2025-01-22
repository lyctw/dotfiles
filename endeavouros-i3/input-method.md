
Install and set environment variable

```
$ yay -S fcitx5 fcitx5-gtk fcitx5-qt
$ yay -S fcitx5-configtool
$ yay -S fcitx5-chewing
$ yay -S fcitx5-mozc
# for x11
$ cat ~/.xprofile
# export fcitx5 environment variables
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS="@im=fcitx5"
```
