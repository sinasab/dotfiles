###############################################################################
# Terminal & iTerm                                                            #
###############################################################################

relative_dir="$(dirname "$0")"

# ----- Terminal.app
# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Disable the annoying line marks
defaults write com.apple.Terminal ShowLineMarks -int 0

# Enable Secure Keyboard Entry in Terminal.app
# See: https://security.stackexchange.com/a/47786/8918
defaults write com.apple.terminal SecureKeyboardEntry -bool true

# Use a modified version of the Solarized Dark theme by default in Terminal.app
osascript <<EOD
tell application "Terminal"
	local allOpenedWindows
	local initialOpenedWindows
	local windowID
	set themeName to "solarized-dark-xterm-256-color"
	(* Store the IDs of all the open terminal windows. *)
	set initialOpenedWindows to id of every window
	(* Open the custom theme so that it gets added to the list
	   of available terminal themes (note: this will open two
	   additional terminal windows). *)
	do shell script "open '$relative_dir/assets/terminal/" & themeName & ".terminal'"
	(* Wait a little bit to ensure that the custom theme is added. *)
	delay 1
	(* Set the custom theme as the default terminal theme. *)
	set default settings to settings set themeName
	(* Get the IDs of all the currently opened terminal windows. *)
	set allOpenedWindows to id of every window
	repeat with windowID in allOpenedWindows
		(* Close the additional windows that were opened in order
		   to add the custom theme to the list of terminal themes. *)
		if initialOpenedWindows does not contain windowID then
			close (every window whose id is windowID)
		(* Change the theme for the initial opened terminal windows
		   to remove the need to close them in order for the custom
		   theme to be applied. *)
		else
			set current settings of tabs of (every window whose id is windowID) to settings set themeName
		end if
	end repeat
end tell
EOD

killall Terminal &> /dev/null

# ----- iTerm.app

# Open the app so the preference files get initialized
open -g "/Applications/iTerm.app" && sleep 2

# Disable warning when quitting
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Quit the app
sleep 2 && osascript -e 'quit app "iTerm"'

# Install material light and dark themes for iterm
open "${relative_dir}/assets/iterm/material-light.itermcolors"
open "${relative_dir}/assets/iterm/material-dark.itermcolors"

# Load prefs from custom folder
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/projects/dotfiles/setup/macos/assets/iterm"
killall iTerm2 &> /dev/null
