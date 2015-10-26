# server completion
_server() {
    local arguments
    arguments=('start' 'stop' 'restart')
    _alternative "args:action:($arguments)"
}
compdef _server server

# fetch_uploads completion
_fetch_uploads() {
    local arguments
    arguments=('elendil' 'westeros' 'essos' 'amandil')
    _alternative "args:server:($arguments)"
}
compdef _fetch_uploads fetch_uploads

# composer completion
_composer() {
    _alternative "args:composer command:( $(composer list --raw | cut -f 1 -d " " | tr "\n" " ") )"
}
compdef _composer composer
