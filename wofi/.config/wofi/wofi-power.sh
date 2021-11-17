#!/bin/sh


Shutdown_command="systemctl poweroff"
Reboot_command="systemctl reboot"
Logout_command="i3 exit"
Hibernate_command="systemctl hibernate"
Suspend_command="systemctl suspend"
Back_command=""

# you can customise the rofi command all you want ...
rofi_command="rofi -dpi 120 -theme ~/.config/wofi/launcherSmoll.rasi"
options=$'Back\nShutdown\nLogout\nReboot\nHibernate\nSuspend' 

# ... because the essential options (-dmenu and -p) are added here
eval \$"$(echo "$options" | $rofi_command -dmenu -p "")_command"
