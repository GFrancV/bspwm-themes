# Config Linux

![Preview](/images/preview/Preview.png)



## Before the instalation

### ZSH
To set ZSH for the default shell you need to edit the file: /etc/passwd and add the followin command: 

```bash
{username}:x:1634231:100:{Your Name}:/home/{username}:/bin/zsh
```

### Enable laptop mode
This mode is for activate the energy mode saving in the laptop and optimze its performance. Need to edit the values of the file: /etc/laptop-mode/laptop.mode.conf whit this:
```
ENABLE_LAPTOP_MODE_ON_AC=1
ENABLE_LAPTOP_MODE_ON_BATTERY = 1
```
Then start the program with this command:
```
$ sudo laptop_mode start
```


- Video with the instructions of the instalation (in Spanish): [View](https://www.youtube.com/watch?v=mHLwfI1nHHY)
- Pastebin with the commands: [View](https://pastebin.com/EEX1Dsuq)
- Laptop mode: [View](https://askubuntu.com/questions/180712/how-to-enable-laptop-mode)

