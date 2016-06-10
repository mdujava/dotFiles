function connect(){
	echo "connect"
	xrandr --output HDMI1 --right-of eDP1 --preferred --primary --output eDP1 --preferred
}

function disconnect(){
	echo "desconnect"
	xrandr --output HDMI1 --off
}

function connectVGA(){
	echo "connVGA"
	xrandr --output VGA1 --right-of eDP1 --preferred --primary --output eDP1 --preferred
}

function disconnectVGA(){
	echo "disconnVGA"
	xrandr --output VGA1 --off
}

function connectDP1-1(){
	echo "connDP1-1"
	xrandr --output DP1-1 --right-of eDP1 --preferred --primary --output eDP1 --preferred
}

function disconnectDP1-1(){
	echo "disconnDP1-1"
	xrandr --output DP1-1 --off
}

xrandr | grep "HDMI1 connected" &> /dev/null && connect || disconnect &&
xrandr | grep "VGA1 connected" &> /dev/null && connectVGA || disconnectVGA
xrandr | grep "DP1-1 connected" &> /dev/null && connectDP1-1 || disconnectDP1-1
