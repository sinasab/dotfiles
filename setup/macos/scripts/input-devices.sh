###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Trackpad: map bottom right corner to right-click # TODO_SINA
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

# ----- Keyboard 

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Use scroll gesture with the Ctrl (^) modifier key to zoom
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
# Follow the keyboard focus while zoomed in
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Stop iTunes from responding to the keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

# Keyboard shortcut to toggle mission control / application menus view
# see these resources for more info on this:
# http://krypted.com/mac-os-x/defaults-symbolichotkeys/
# https://web.archive.org/web/20141112224103/http://hintsforums.macworld.com/showthread.php?t=114785
# ctrl-up to mission control
# defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 32 '{ enabled = 1; value = { parameters = ( 65535, 126, 262144 ); type = standard; }; }'
# defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 34 '{ enabled = 1; value = { parameters = ( 65535, 126, 393216); type = standard; }; }'
# # mouse button 5 to mission control
# defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 38 '{ enabled = 1; value = { parameters = ( 16, 16, 0); type = button; }; }'
# defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 40 '{ enabled = 1; value = { parameters = ( 16, 16, 131072); type = button; }; }'
relative_dir="$(dirname "$0")"
defaults import com.apple.symbolichotkeys $(pwd)/setup/macos/assets/system/symbolichotkeys.plist

# ----- Bluetooth stuff
# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Disable bluetooth controlling power state
sudo defaults write /Library/Preferences/com.apple.Bluetooth ControllerPowerState -int 0
