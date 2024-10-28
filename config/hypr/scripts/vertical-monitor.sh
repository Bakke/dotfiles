#!/bin/bash
if [[ $(hyprctl monitors all | grep -ic 'description: HP Inc. HP E273q') > 0 ]]; then
    hyprctl dispatch exec '[workspace 3 silent] /opt/teams-for-linux/teams-for-linux'
    hyprctl dispatch exec '[workspace 3 silent] "/opt/Prospect Mail/prospect-mail"'
fi
