# Dotfiles

This repo contains a simple scripts to install and configure a very cool desktop enviroment without need to know how to create or configure shell scripts.

## Used programs

This program uses different apps and repositories to maximize the user experience.

- [`bspwm`](https://github.com/baskerville/bspwm) and [`sxhkd`](https://github.com/baskerville/sxhkd): Like our windows manager.
- [`kitty`](https://github.com/kovidgoyal/kitty): Like our terminal emulator.
- [`feh`](https://github.com/derf/feh): To set a wallpaper.
- [`polybar`](https://github.com/polybar/polybar): Like our status bar.
- [`picom`](https://github.com/yshui/picom): To set transparency and personlity to bspwm.
- [`ranger`](https://github.com/ranger/ranger): As our file manager in terminal.

## Fonts

- Isovaka Nerd Font
- Hack Nerd Font
- Feather font.

# Instalation

> Note: To install this dektop enviroment no need to install any dependencies or some other programs, this script will do everything for you, just relax.

Follow the steps bellow to install this desktop enviroment on your system.

### 1. Clone this repository

```bash
git clone https://github.com/GFrancV/dotfiles

```

### 2. Change to clone repository and execute the `./setup.sh`

```bash
cd dotfiles
./setup.sh
```

### 3. Select an option

```text
****************************************
      Starting the  Configuration
****************************************
Installation wizard. For more information read README.MD file.
Select a option configuration for your Linux.
1. Basic instalattion
2. Theme selector
Select one option:
```

1. With option 1 the installation will start, all the necessary programs, their settings and all their dependencies will be installed.

2. With option 2 you can switch between themes at any time even after the installation has been completed.
   > Note: For use the option 2 you must have installed and configured all the programs before.

### 4. Select the theme to install

```text
****************************************
      Select theme to install
****************************************
Theme selector
For more information about themes you can view the previews in the README.MD files or on preview folder.
Which theme you want to install?
1. Purple Theme
2. Blue Theme
Select one option:
```

Before the instalation of the necessary programs we need to choose which theme we want to install (purple or blue), for this you can view the section [Available themes](#available-themes).

### 5. That's all, now you have these themes installed on your PC.

# Important notes

## Terminal emulator

By default the emulator terminal used in this desktop enviroment is [Kitty](https://github.com/kovidgoyal/kitty) (All the config files are to kitty terminal) despite that the config-files folder has a configuration file to use [Alacritty](/config-files/dotfiles/alacritty/).

## Installation for Debian

First to install this theme in Debian we need to install `sudo`, to enable sudo commands on Debian+11 add this command in `/etc/sudoers`:

```bash
{USERNAME} ALL=(ALL:ALL) ALL
```

> Note: Replace the section 'USERNAME' with your userneme.

# Available themes

## Blue theme

![Preview1](/images/preview/preview-blue.png)

## Purple theme

![Preview2](/images/preview/preview-purple.png)

# External repos

For the creation of this script external repositories were used to improve the appearance of the final result.
Those repositories are:

- [rofi-themes-collection](https://github.com/lr-tech/rofi-themes-collection)
- [polybar-themes](https://github.com/adi1090x/polybar-themes)

I recommend visiting these repos to see their documentation and have more unique customization.

# References

- Video with the instructions of the instalation (in Spanish): [View](https://www.youtube.com/watch?v=mHLwfI1nHHY)
- Pastebin with the commands: [View](https://pastebin.com/EEX1Dsuq)
- Laptop mode: [View](https://askubuntu.com/questions/180712/how-to-enable-laptop-mode)
- Alacritty config: [View](https://gist.github.com/yoonhoGo/61ea18476a127f5db7b86471ee027876)
- Debian + Bspwm (in Spanish): [View](https://www.youtube.com/watch?v=823RcAIitjk)
