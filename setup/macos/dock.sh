###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################


# ----- Dock
# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Set the icon size of Dock items in pixels
defaults write com.apple.dock tilesize -int 50

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "genie"

# Do not minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool false

# Enable spring loading (open on file/folder drag over) for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool true

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0.5

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Wipe all (default) app icons from the Dock
# Then add the ones we want
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Google Chrome.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Visual Studio Code.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Alacritty.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/iTerm.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
defaults write com.apple.dock persistent-others -array


# ----- Mission Control
# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Don’t group windows by application in Mission Control
# (i.e. use the old Exposé behavior instead)
defaults write com.apple.dock expose-group-by-app -bool false


# ----- Dashboard
# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Enable Dashboard dev mode (allows keeping widgets on the desktop)
defaults write com.apple.dashboard devmode -bool true

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true


# ----- Spaces
# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false


# ----- Launchpad
# Disable the Launchpad gesture (pinch with thumb and three fingers)
defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

# Reset Launchpad, but keep the desktop wallpaper intact
find "${HOME}/Library/Application Support/Dock" -name "*-*.db" -maxdepth 1 -delete


# ----- Hot corners
# hover relevant corner with the modifier key pressed to do the action
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# Top left screen corner → Mission Control
defaults write com.apple.dock wvous-tl-corner -int 2
# Top right screen corner → Desktop
defaults write com.apple.dock wvous-tr-corner -int 4
# Bottom left screen corner → Start screen saver
defaults write com.apple.dock wvous-bl-corner -int 5
# Bottom right screen corner → Put display to sleep
defaults write com.apple.dock wvous-br-corner -int 10
# Set all to use ctrl as their modifier key; ctrl = 262144
# also notable: cmd = 1048576, option = 524288, shift = 131072
defaults write com.apple.dock wvous-tl-modifier -int 262144
defaults write com.apple.dock wvous-tr-modifier -int 262144
defaults write com.apple.dock wvous-bl-modifier -int 262144
defaults write com.apple.dock wvous-br-modifier -int 262144

# ----- Restart the dock
killall Dock