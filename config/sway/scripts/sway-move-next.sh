wsNext=$(( $( swaymsg -t get_workspaces | jq '.[] | select(.focused).num' ) + $1))

if [ $wsNext -lt 1 ]; then
    wsNext=1
fi

swaymsg move container to workspace $wsNext
swaymsg workspace $wsNext
