# Add homestead virtualbox
vagrant box add laravel/homestead

# Clone Homestead repo
git clone https://github.com/laravel/homestead.git ~/Homestead

# Enter Homestead dir
cd ~/Homestead

# Checkout version
git checkout v7.20.0

# Init Homestead
source init.sh
