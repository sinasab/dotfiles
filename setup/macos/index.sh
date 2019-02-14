# Ask for the administrator password upfront
sudo -v

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

relative_dir="$(dirname "$0")"

source $relative_dir/dock.sh
source $relative_dir/safari-and-webkit.sh
source $relative_dir/spotlight.sh