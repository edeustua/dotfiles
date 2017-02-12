#!/bin/sh

# .xinitrc

# Resources
xrdb ~/.Xresources

# xset
xset +fp ~/.fonts
xset +fp /usr/share/fonts/local
xset fp rehash
xsetroot -cursor_name left_ptr &
xset r rate 280 38
setxkbmap -option caps:swapescape
#xrandr --output HDMI1 --auto --pos 1920x0 --output DP2 --auto --left-of HDMI1 --pos 0x60
xrandr --output HDMI1 --auto --pos 1920x0 --output DP2 --auto --pos 0x60

xflux -z 48864 &

# Start gnome-keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Start programs
unclutter -grab -noevents -root &
urxvtd &
sxhkd & 
compton &
numlockx &
#conky -c ~/.conkyrc
#stalonetray

# Wallpapers
#hsetroot -fill ~/Pictures/wallpaper/Straight_Up-1920x1200.jpg
#hsetroot -fill ~/Pictures/wallpaper/9231275034_716e309d7e_o.jpg
#hsetroot -fill ~/Pictures/wallpaper/The_Southern_Alps_PhotonFossil/Southern_Alps_1920x1200.jpg
hsetroot -fill ~/Pictures/wallpaper/hongkong3840x1200.jpg
#hsetroot -solid #0A3A54
#hsetroot -center ~/Pictures/wallpaper/hyeres_-france-1932_cropped.jpg
#hsetroot -center ~/Pictures/wallpaper/kuelap04-3840x1200.jpg
#hsetroot -fill ~/Pictures/wallpaper/SanFrancisco_1920x1200.jpg
#hsetroot -fill ~/Pictures/wallpaper/serene_alps_1920.JPG
#hsetroot -fill ~/Pictures/wallpaper/sea_Wallpaper_1920x1200_www.wallpaperwind.com.jpg


exec bspwm
