wsNext=$(( $( i3-msg -t get_workspaces | jq '.[] | select(.focused).num' ) + $1))

if [ $wsNext -lt 1 ]; then
    wsNext=1
fi

i3-msg workspace number $wsNext
