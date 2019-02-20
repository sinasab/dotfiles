# dotfiles

## Setup - Run a bunch of commands

### General Setup

- Clone the repo, including submodule files:

```bash
$ git clone --recursive https://github.com/sinasabet81/dotfiles.git
# or if you already cloned the repo but didn't initialize the submodules:
$ git submodule update --init --recursive
```

- `cd` into the project directory.
- Symlink files and folders from this repo to your home directory using the shell script:

```bash
$ ./setup/install.sh
```

- Also install some global npm dependencies:

```bash
$ yarn global add \
tldr \
gtop \
vtop
```

### MacOS-specific Setup

- Install x-code cli tools at [this link](https://developer.apple.com/xcode/), then run:

```bash
$ xcode-select --install
```

- Install [homebrew](https://brew.sh/):

```bash
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

- Then use it to install everything via the [`Brewfile`](https://github.com/Homebrew/homebrew-bundle):

```bash
$ brew bundle
```

- Run this for some automated macos system config:

```bash
$ ./setup/macos/index.sh
```

- Then some manual MacOS tweaks (some may have been attempted to be changed by script):
  - General
    - appearance -> graphite
    - click scroll bar to jump to the spot that's clicked
    - ask to keep changes when closing documents
    - Use LCD font smoothing when available
  - Desktop & Screensaver
    - Don't forget to set a cool wallpaper and screensaver
  - Dock
    - Double-click a window's title bar to minimize
    - Do not minimize windows into application icon
    - Animate opening applications
    - Automatically hide and show the dock
    - Show indicators for open applications
  - Mission Control
    - Do not rearrange spaces based on most recent use
    - Do not switch to a space with open windows for the application when switching to an application
    - Do not group windows by application
    - Displays have separate spaces
    - Dashboard off
    - Map Mouse Button 5 to open Mission Control
    - Hot Corners
      - All have ctrl modifier key
      - TL - Mission Control
      - TR - Desktop
      - BL - Start Screen Saver
      - BR - Put Display to Sleep
  - Language & Region
    - Time format: 24-hour time
  - Security & Privacy
    - General
      - Make sure a login password is set
      - Require password immediately after sleep or screen saver begins
      - Show a message (my email address) when the screen is locked
      - Allow apps downloaded from App Store and identified developers
    - File Vault
      - Turn file vault on
    - Firewall
      - Turn firewall on
      - Turn on stealth mode
  - Spotlight
    - Everything under search results should be unchecked
  - Notifications
    - Turn on Do Not Disturb when mirroring to TVs and projectors
  - Display
    - Show mirroring options in the menu bar when available
  - Energy Saver
    - Some of these are for both battery and power adapter
    - Slighly dib the display while on battery power
    - Prevent computer from sleeping automatically when the display is off
    - Do not put hard disks to sleep when possible
    - Wake for wifi access
    - Enable Power Nap
    - Show battery status in menu bar
  - Keyboard
    - Adjust keyboard brightness in low light
    - Touchbar shows expanded control strip
    - Show keyboard and emoji viewers in menu bar
    - Modifier keys
      - Map Caps Lock to Control
      - If external keyboard with windows layout, swap option and command
  - Mouse
    - Scroll direction: Natural
    - Tracking speed: Fast
  - Trackpad
    - Point & Click
      - Uncheck look up & data detectors
      - Secondary click -> Click or tap with two fingers
      - Tap to click with one finger
      - Click -> Medium
      - Tracking speed -> Fast
      - Force click and haptic feedback
    - Scroll & Zoom
      - Check all
    - More gestures
      - Check only the following, unchecking the rest
      - Swipe between full-screen apps with 3 fingers
      - Mission control swipe up with 3 fingers
      - Show desktop spread with thumb and three fingers
  - iCloud
    - Uncheck everything except keychain and find my mac
  - App Store
    - Automatically check for updates
    - Download newly available updates in the background
    - Uncheck the rest to not automatically install the downloaded updates
    - Do not automatically download apps purchased on other Mac computers
    - Require a password for purchases after 15 minutes
    - Save password for free downloads
  - Bluetooth
    - Show bluetooth in menu bar
  - Touch ID
    - Add and label right and left index fingers
    - Use TouchID for - unlocking, apple pay, and iTunes & App Store
  - Users & Groups
    - Should have the following login items opening (none hidden)
      - Spectacle
      - Backup and Sync from Google
      - Google Chrome
      - Alfred 3
      - Flux
  - Siri
    - Disable Ask Siri
  - Date & Time
    - Set date and time automatically
    - Set timezone automatically
    - Show date and time in menu bar
    - Digital time
    - Display time with seconds
    - Use a 24-hour clock
    - Show day of the week
    - Show date

### References

- https://github.com/mathiasbynens/dotfiles
- https://github.com/atomantic/dotfiles/
- https://github.com/herrbischoff/awesome-macos-command-line/
- probably others that I forgot :(

### TODOs

- tighten macos settings (automate all of it)
- version control vscode setup
- version control alacritty settings
- look into open source alfred alternatives, maybe [zazu](https://github.com/tinytacoteam/zazu)? 
- add spin-up-able test environment dockerfiles maybe
