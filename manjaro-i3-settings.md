
## urxvt Terminal

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

## System font and font size

run `lxappearance`


## Trobleshooting

1. [Booting to black screen](ihttps://forum.manjaro.org/t/solved-booting-to-black-screen/45154)
2. Check out `/etc/default/grub` after `sudo pacman -Syu`
  * add `iommu=soft` to `GRUB_CMDLINE_LINUX_DEFAULT`
  * `sudo update-grub`


