# Config Linux

![Preview](/images/preview/Preview-01.png)

## Install fonts
/usr/local/share/fonts/fonts
fc-cache -v

## Before the instalation
### Rofi
To personalize the apparience of rofi we need do this manualy.  
First execute Rofi `super + d` and select `rofi-theme-selector`, use the *Nord* theme (or that your taste).

### ZSH
To set ZSH for the default shell you need to edit the file: `/etc/passwd` and add the followin command: 

```bash
{username}:x:1634231:100:{Your Name}:/home/{username}:/bin/zsh
```

### Enable laptop mode
This mode is for activate the energy mode saving in the laptop and optimze its performance. Need to edit the values of the file: `/etc/laptop-mode/laptop.mode.conf` whit this:
```
ENABLE_LAPTOP_MODE_ON_AC=1
ENABLE_LAPTOP_MODE_ON_BATTERY = 1
```
Then start the program with this command:
```
$ sudo laptop_mode start
```

## References
- Video with the instructions of the instalation (in Spanish): [View](https://www.youtube.com/watch?v=mHLwfI1nHHY)
- Pastebin with the commands: [View](https://pastebin.com/EEX1Dsuq)
- Laptop mode: [View](https://askubuntu.com/questions/180712/how-to-enable-laptop-mode)
- Alacritty config: [View](https://gist.github.com/yoonhoGo/61ea18476a127f5db7b86471ee027876)
