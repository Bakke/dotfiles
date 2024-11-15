if [ -x "$(command -v swaymsg)" ]; then
    cmdName='swaymsg'
elif [ -x "$(command -v i3-msg)" ]; then
    cmdName='i3-msg'
else
    echo 'Error: swaymsg or i3-msg is not installed.'
    exit 1
fi

wsNext=$(( $( $cmdName -t get_workspaces | jq '.[] | select(.focused).num' ) + $1))

if [ $wsNext -lt 1 ]; then
    wsNext=1
fi

$cmdName workspace number $wsNext
