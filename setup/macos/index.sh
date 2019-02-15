# Ask for the administrator password upfront
sudo -v

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

relative_dir="$(dirname "$0")"

source $relative_dir/scripts/activity-monitor.sh
source $relative_dir/scripts/app-store.sh
source $relative_dir/scripts/dock.sh
source $relative_dir/scripts/finder.sh
source $relative_dir/scripts/general-ui-ux.sh
source $relative_dir/scripts/google-chrome.sh
source $relative_dir/scripts/input-devices.sh
source $relative_dir/scripts/misc.sh
source $relative_dir/scripts/safari-and-webkit.sh
source $relative_dir/scripts/screen.sh
source $relative_dir/scripts/spotlight.sh
source $relative_dir/scripts/ssd-tweaks.sh
source $relative_dir/scripts/terminal-and-iterm.sh
source $relative_dir/scripts/time-machine.sh

# references
# - https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# - https://github.com/atomantic/dotfiles/blob/master/install.sh