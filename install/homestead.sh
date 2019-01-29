# Clone Homestead repo
git clone git@gitlab.idrift.no:seb/homestead.git ~/Homestead

# Enter Homestead dir
cd ~/Homestead

# Add homestead virtualbox
vagrant box add laravel/homestead

# Init Homestead
source init.sh
