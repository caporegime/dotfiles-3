#!/bin/mksh
# Display cover art based on "mpc current"
#
# Created by Dylan Araps
# https://github.com/dylanaraps/dotfiles

# Hide terminal cursor
tput civis

# Cover directory
dir=$HOME/Music/covers/

# Image size
width=140
height=139

# Image offset
xoffset=0
yoffset=

# Image format
format=jpg

while :; do
	currentsong=$(mpc current | sed -e 's/\///g')
    img="$dir$currentsong.$format"

	w3m_command="0;1;$xoffset;$yoffset;$width;$height;;;;;$img\n4;\n3;"
	echo -e "$w3m_command" | /usr/lib/w3m/w3mimgdisplay

    # Update on mpd play/pause/next/prev and database update
	mpc idle player update > /dev/null 2>&1
done

