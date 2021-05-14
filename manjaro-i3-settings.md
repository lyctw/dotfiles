
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
sudo vim /usr/share/conky/conky_maia                                                           18s 16:14:18
sudo vim /usr/share/conky/conky1.10_shortcuts_maia
```

## Troubleshoot

1. [Booting to black screen](ihttps://forum.manjaro.org/t/solved-booting-to-black-screen/45154)
2. Check out `/etc/default/grub` after `sudo pacman -Syu`
    * add `iommu=soft` to `GRUB_CMDLINE_LINUX_DEFAULT`
    * `sudo update-grub`


