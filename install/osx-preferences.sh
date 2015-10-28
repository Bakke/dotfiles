#Fix fonth smoothing
# defaults -currentHost write -globalDomain AppleFontSmoothing -int 0

#Disable window animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

#Enable repeat on keydown
defaults write -g ApplePressAndHoldEnabled -bool false

#Use current directory as default search scope in Finder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

#Show Path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

#Show Status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

#Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0.02

#Set a shorter Delay until key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 12

#Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true &&
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true &&
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

#Show the ~/Library folder
chflags nohidden ~/Library
