* i3 config file: `.i3/config`
* Commonly used packages
  ```
  sudo pacman -S zathura ranger flameshot \
                 newsboat tldr gdb-multiarch lsof \
                 ttf-ubuntu-font-family \
                 ttf-fira-code \
                 docker \
                 pavucontrol \
                 cscope ctags \
                 pdfgrep 
  ```
* pdflatex for building riscv-isa-manual: `sudo pacman -S make texlive-most texlive-bin`
* opencc: `sudo pacman -S opencc`
  * Usage: `opencc -i cn.md -o tw.md -c s2twp.json`

## ~~urxvt Terminal~~

`~/.Xresources`

```
! Font & font size: 
URxvt.font: xft:FiraCode:size=17
...
! for 'fake' transparency
URxvt*inheritPixmap:            true
URxvt*transparent:              true
URxvt*shading:                  35
```

## Terminator

`sudo pacman -S terminator`

## Change default browser from Pale Moon to Brave

Edit `vim ~/.config/mimeapps.list` and `vim ~/.profile`

Find desktop file (e.g. zathura): `pacman -Ql zathura-pdf-poppler | grep .desktop`


## System font and font size

Run `lxappearance`

## Change background 

Run `nitrogen` or `lightdm-settings`

## Change login background 

Run `lightdm-settings`

## Lanuch Bluetooth

Run `blueman-applet`

## CPU and shortcut infomations font size

```
sudo vim /usr/share/conky/conky_maia  
sudo vim /usr/share/conky/conky1.10_shortcuts_maia
```

## Troubleshoot

1. [Booting to black screen](ihttps://forum.manjaro.org/t/solved-booting-to-black-screen/45154)
2. Check out `/etc/default/grub` after `sudo pacman -Syu`
    * add `iommu=soft` to `GRUB_CMDLINE_LINUX_DEFAULT`
    * `sudo update-grub`



## Install xfce4-power-manage

```
sudo pacman -S xfce4-power-manager
```


## Input Methods

Install ibus-chewing

```
sudo pacman -S ibus ibus-chewing
```

Install ibus-mozc from AUR

```
sudo pamac build ibus-mozc
```

Righ click the bottom right ibus icon > Preferences > Add Chewing & Mozc.

![](https://i.imgur.com/D4uu8Xl.png)

```
vim ~/.profile
```

```
export XMODIFIERS="@im=ibus"
export XMODIFIER="@im=ibus"
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export DefaultIMModule=ibus
ibus-daemon -drx
```

Then logout or reboot to take effect.

## Emojo

```
sudo pacman -S noto-fonts-emoji
```

## Obsidian extensions

### Pandoc (via LaTeX) for exporting PDF

Install [pandoc community plugin in obsidian](https://github.com/OliverBalfour/obsidian-pandoc) pandoc and Google Noto CJK fonts (Chinese font included) on your host.

`yay -S pandoc extra/noto-fonts-cjk`

Add this metadate at the beginning of markdown file.

```
---
mainfont: Noto Sans Mono CJK TC
---
```

Then use `<Ctrl+P>` and type `pandoc LaTeX` to export and preview PDF (obsiously some markdown syntax cannot be rendered, simply don't use it :P)
