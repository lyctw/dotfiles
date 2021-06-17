## Install 

```shell
sudo pacman -S sonic-visualiser audacity
```

sonic-visualiser plugins:

* Chord estimate - Chordino and NNLS Chroma
* Key detection - Queen Mary plugin set
* Low-pass filter - invada-studio-plugins
  * removed from plugins and failed to load into sonic-visualiser
  * `sudo pacman -S extra/ladspa` for compiling to source code

## Install [Queen Mary plugin set](https://www.vamp-plugins.org/download.html?platform=linux64&search=Queen+Mary+plugin+set&go=Go)

![](https://i.imgur.com/jlc2qeY.png)

```shell
tar -xvf qm-vamp-plugins-1.8.0-linux64
```

This package contains plugins compiled for Linux on 64-bit processors.

To install them, copy the following files:

   qm-vamp-plugins.so
   qm-vamp-plugins.cat
   qm-vamp-plugins.n3

to one of the following directories:

   /usr/local/lib/vamp/
   /usr/lib/vamp/
   $HOME/vamp/

