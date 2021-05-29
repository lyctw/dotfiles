
`.i3/config` or `.config/i3/config` ??????????

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

Edit `vim ~/.config/mimeapps.list`


## System font and font size

Run `lxappearance`

## Change background 

Run `nitrogen`

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
sudo pacmac -S ibus ibus-chewing
```

Install ibus-mozc from AUR

```
sudo pamac build ibus-mozc
```

Righ click the bottom right icon of ibus > Preferences > Add Chewing & Mozc
Then logout or reboot to take effect.

![](https://i.imgur.com/D4uu8Xl.png)




