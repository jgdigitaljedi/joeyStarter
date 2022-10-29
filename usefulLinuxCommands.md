# Useful Linux commands

This is just a collection of interesting Linux commands I've stumbled across over the years.

## Get most used commands

```sh
history | awk 'BEGIN {FS="[ \t]+|\\|"} {print $3}' | sort | uniq -c | sort -nr | head -10
```

## Fix apt dependency errors

```sh
sudo dpkg --configure -a
sudo apt --fix-broken install
```

## Adjust laptop keyboard backlight brightness

```sh
gdbus call --session --dest org.gnome.SettingsDaemon.Power --object-path /org/gnome/SettingsDaemon/Power --method org.gnome.SettingsDaemon.Power.Keyboard.StepUp
```

## Change default terminal

```sh
`sudo update-alternatives --config x-terminal-emulator`
```
