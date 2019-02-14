# mostly from https://github.com/atomantic/dotfiles/blob/master/install.sh
# Disable remote login
sudo systemsetup -setremotelogin off

# Disable wake-on modem
sudo systemsetup -setwakeonmodem off

# Disable guest account login
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false

# Set standby delay to 24 hours (default is 1 hour)
sudo pmset -a standbydelay 86400

# disable boot sound effect
sudo nvram SystemAudioVolume=" "

# "Menu bar: disable transparency"
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# disable smart quotes and dashes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Increase sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Set a blazingly fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 6
defaults write NSGlobalDomain InitialKeyRepeat -int 20

#Require password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to the desktop"
defaults write com.apple.screencapture location -string "${HOME}/Desktop"
# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)"
defaults write com.apple.screencapture type -string "png"
# Show hidden files by default"
defaults write com.apple.finder AppleShowAllFiles -bool true

# "Show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# "Show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

# "Show path bar"
defaults write com.apple.finder ShowPathbar -bool true

# "Allow text selection in Quick Lo"
defaults write com.apple.finder QLEnableTextSelection -bool true

# "Display full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# "When performing a search, search the current folder by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# "Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# "Enable spring loading for directories"
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# "Remove the spring loading delay for directories"
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# "Disable disk image verification"
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# "Automatically open a new Finder window when a volume is mounted"
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# "Use list view in all Finder windows by default"
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# "Disable the warning before emptying the Trash"
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# "Empty Trash securely by default"
defaults write com.apple.finder EmptyTrashSecurely -bool true

# "Expand the following File Info panes: “General”, “Open with”, and “Sharing & Permissions”"
defaults write com.apple.finder FXInfoPanesExpanded -dict \
  General -bool true \
  OpenWith -bool true \
  Privileges -bool true

  # "Enable highlight hover effect for the grid view of a stack (Dock)"
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# "Set the icon size of Dock items to 36 pixels"
defaults write com.apple.dock tilesize -int 36

# "Change minimize/maximize window effect to scale"
defaults write com.apple.dock mineffect -string "scale"

# "Minimize windows into their application’s icon"
defaults write com.apple.dock minimize-to-application -bool true

# "Enable spring loading for all Dock items"
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# "Show indicator lights for open applications in the Dock"
defaults write com.apple.dock show-process-indicators -bool true

# "Don’t animate opening applications from the Dock"
defaults write com.apple.dock launchanim -bool false

# "Speed up Mission Control animations"
defaults write com.apple.dock expose-animation-duration -float 0.1

# "Don’t group windows by application in Mission Control"
# (i.e. use the old Exposé behavior instead)
defaults write com.apple.dock expose-group-by-app -bool false

# "Disable Dashboard"
defaults write com.apple.dashboard mcx-disabled -bool true

# "Don’t show Dashboard as a Space"
defaults write com.apple.dock dashboard-in-overlay -bool true

# "Don’t automatically rearrange Spaces based on most recent use"
defaults write com.apple.dock mru-spaces -bool false

# "Remove the auto-hiding Dock delay"
defaults write com.apple.dock autohide-delay -float 0

# "Remove the animation when hiding/showing the Dock"
defaults write com.apple.dock autohide-time-modifier -float 0

# "Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

# "Make Dock icons of hidden applications translucent"
defaults write com.apple.dock showhidden -bool true

# "Make Dock more transparent"
defaults write com.apple.dock hide-mirror -bool true

# "Reset Launchpad, but keep the desktop wallpaper intact"
find "${HOME}/Library/Application Support/Dock" -name "*-*.db" -maxdepth 1 -delete

# "Show the main window when launching Activity Monitor"
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# "Visualize CPU usage in the Activity Monitor Dock icon"
defaults write com.apple.ActivityMonitor IconType -int 5

# "Show all processes in Activity Monitor"
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# "Sort Activity Monitor results by CPU usage"
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0


# "Enable the debug menu in Disk Utility"
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true