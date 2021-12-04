# Config Linux

# Table of contents

-   [After the instalation](#after-the-instalation)
    -   [Instalation options](#instalation-options)
-   [Before the instalation](#before-the-instalation)
    -   [Rofi](#rofi)
    -   [ZSH](#zsh)
-   [Available themes](#available-themes)
-   [References](#references)

# After the instalation

## Instalation options

For install the configuration you have a menu with 3 options, then below we will describe each of the options.

### 1. Auto install:

In this option will be installed basic apps, the most important options are:

-   [kitty terminal](https://github.com/kovidgoyal/kitty).
-   [bspwm](https://github.com/baskerville/bspwm) and [sxhkd](https://github.com/baskerville/sxhkd).
-   [feh (for set wallpaper)](https://github.com/derf/feh).
-   [polybar](https://github.com/polybar/polybar).
-   [picom (for the transparency)](https://github.com/yshui/picom).
-   [ranger](https://github.com/ranger/ranger).

Before the instalation of the necessary programs we need to choose which theme we want to install (purple or blue), for this you can view the section [Available themes](#available-themes).  
By default the emulator terminal that we are going to use is [Kitty](https://github.com/kovidgoyal/kitty) (All the config files are to kitty terminal) despite that the config-files folder has a configuration file to use alacritty. We also have ranger as default file manager from the command line, to learn how to use ranger [view this page](https://www.digitalocean.com/community/tutorials/installing-and-using-ranger-a-terminal-file-manager-on-a-ubuntu-vps).

### 2. Custom configuration

In custom configuration we have a submenu with multiple options. Then we will describe each of the options:

1. **Instal for Debian.\_** This option add new commands for intall sudo and aditional commands to run this config in Debian +11.  
   **NOTE:** To enable sudo commands in Debian add this command in `/etc/sudoers`:

```
{USERNAME} ALL=(ALL:ALL) ALL
```

2. **Theme selector.\_** With this option we can change the theme at any time even after the installation has been completed.

### 3. Install all packets

## Install fonts

/usr/local/share/fonts/fonts
fc-cache -v

# Before the instalation

## Rofi

To personalize the apparience of rofi we need do this manualy.  
First execute Rofi `super + d` and select `rofi-theme-selector`, use the _Nord_ theme (or that your taste).  
_INSERT IMG_

## ZSH

To set ZSH for the default shell you need to edit the file: `/etc/passwd` and add the followin command:

```bash
{username}:x:1634231:100:{Your Name}:/home/{username}:/bin/zsh
```

## Enable laptop mode

This mode is for activate the energy mode saving in the laptop and optimze its performance. Need to edit the values of the file: `/etc/laptop-mode/laptop.mode.conf` whit this:

```
ENABLE_LAPTOP_MODE_ON_AC=1
ENABLE_LAPTOP_MODE_ON_BATTERY = 1
```

Then start the program with this command:

```
$ sudo laptop_mode start
```

# Available themes

## Blue theme

![Preview1](/images/preview/preview-blue.png)

## Purple theme

![Preview2](/images/preview/preview-purple.png)

# References

-   Video with the instructions of the instalation (in Spanish): [View](https://www.youtube.com/watch?v=mHLwfI1nHHY)
-   Pastebin with the commands: [View](https://pastebin.com/EEX1Dsuq)
-   Laptop mode: [View](https://askubuntu.com/questions/180712/how-to-enable-laptop-mode)
-   Alacritty config: [View](https://gist.github.com/yoonhoGo/61ea18476a127f5db7b86471ee027876)
-   Debian + Bspwm (in Spanish): [View](https://www.youtube.com/watch?v=823RcAIitjk)
