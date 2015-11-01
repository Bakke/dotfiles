SRV_DIR=/srv
SALT_CONFIG_DIR=/srv/salt
SALT_DIR=/etc/salt

# Install saltstack
brew install saltstack

# Check if salt dir exists
if [[ -d "$SALT_CONFIG_DIR" ]]; then # Dir exists

	# Pull latest
	cd "$SALT_CONFIG_DIR" && git pull origin master && cd -

else # Dir does not exist

	# Create directory for server
	sudo mkdir "$SRV_DIR"
	sudo chown "$USER":staff "$SRV_DIR"

	# Clone states from Git
	git clone git@gitlab.idrift.no:salt/dev-osx-states.git "$SALT_CONFIG_DIR"

fi

# Setup minion if it does not exist
if [[ ! -a "$SALT_DIR/minion" ]]; then
	sudo mkdir -p "$SALT_DIR"
	sudo chown "$USER":staff "$SALT_DIR"
	echo "file_client: local" >> "$SALT_DIR/minion"
fi

# Call highstate
sudo salt-call state.highstate

# Setup mysql
sudo chown -R "$USER" /usr/local/var/mysql/
mysql_install_db --verbose --user="$USER" --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp
mysql_secure_installation
