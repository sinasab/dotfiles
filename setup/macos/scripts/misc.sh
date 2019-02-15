###############################################################################
# Address Book, iCal, Photos, TextEdit, and Disk Utility                   #
###############################################################################

# ----- Disk Utility
# Enable the debug menu in Disk Utility
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

# ----- QuickTime Player
# Auto-play videos when opened with QuickTime Player
defaults write com.apple.QuickTimePlayerX MGPlayMovieOnOpen -bool true

# ----- Photos
# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# ----- Messages
# Disable automatic emoji substitution (i.e. use plain text smileys)
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

# Disable smart quotes as it’s annoying for messages that contain code
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

# Disable continuous spell checking
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false

# --- Guest Accounts
# Disable guest account login
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false
