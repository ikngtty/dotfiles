# Manual
## Install applications.
*   (comment out) DB Browser for SQLite.app
*   (comment out) Discord.app
*   (comment out) Eclipse.app
*   Google Drive.app
*   (comment out) IntelliJ IDEA CE.app
*   Karabiner
*   (comment out) PyCharm CE.app
*   (comment out) Racket v7.1
*   [Stack](https://getstack.app/)
*   (comment out) Unity

## Through App Store.
*   Alfred
*   CotEditor
*   GIPHY Capture
*   Kindle
*   Line
*   Microsoft Office 365 (A bundle for Word, Excel, PowerPoint and Outlook)
*   Slack
*   TweetDeck
*   Xcode

### jar
*   (comment out) Automaton Simulator

### My scripts
TODO: Decide how share them.
*   Connect_with_iPhone.app
*   Google Chrome(fullscreen).app

## Install fonts.
Install with Homebrew Cask except below.
*   [Ricty](https://www.rs.tus.ac.jp/yyusa/ricty.html)

TODO: Make it scripts.

## Set up GUI.
### Mac
*   Adjust brightness of display.
*   Change the computer name (and reboot?).
    ```
    sudo scutil --set LocalHostName *localhost name(ex.MBA-of-ikngtty)]*
    sudo scutil --set ComputerName *computer name(ex.MBA-of-ikngtty)*
    ```
*   Trackpad
    *   Turn on `Application Expose`.
    *   Adjust sensitivity.
*   General
    *   Make Vivaldi the default browser.
*   Security and Privacy
    *   The time require the password is right after sleeping and saving the screen.
*   Keyboard
    *   Keyboard
        *   Make function keys default.
    *   User Dictionary
        *   Disable auto-correcting spell.
        *   Disable inputting period by pushing space key twice.
    *   Shortcut
        *   Application
            *   Add these shortcuts.
                *   All applications - ペーストしてスタイルを合わせる - ⌘V
                *   All applications - 貼り付けてスタイルに合わせる - ⌘V
    *   Input Source
        *   Input Mode
            *   Enable all options.
*   Dock
    *   Change position to left.
    *   Turn on to show/hide automatically.
    *   Adjust sizes.
    *   Change lineups. TODO: Descirbe.
*   Finder
    *   General
        *   Start with the home folder.
        *   Turn off to open folder in new tab.
    *   Sidebar
        *   Add home and HDD.
*   Bluetooth
    *   Display on menubar.
*   Desktop and ScreenSaver
*   Saving energy
    *   Do not darken when using a battery.
*   Others
    *   Change default place to save screenshots to a clipboard.

TODO: Try to make it scripts with using `defaults` command.

### Alfred
*   General
    *   I'm in Japan.
*   Features
    *   Default Results
        *   Turn on `Folders`.
*   Appearance
    *   Choose theme.

### Atom
Use `Sync Settings` package.
Follow my comment in `init.coffee`.
TODO: Make it scripts.
TODO: Find out steps to create Lisp IDE.

### CotEditor
1.  Download themes from [here](https://github.com/naotaka/CotEditor-themes).
2.  Open the theme specified below.
3.  Make CotEditor read it at `settings` window. (Then they can be deleted.)

*   Display
    *   Font -> Ricty Diminished 18pts
    *   Theme -> base16-Monokai.dark

TODO: Make it scripts.

### Fish
Use `fish_config` command.
*   colors -> Choose `Tomorrow Night Bright` theme.

### Google IME
TODO:

### Insomnia
*   Interface Font Size - 16px
*   Text Editor Font - Ricty Diminished
*   Editor Font Size - 18px

TODO: Make it scripts.

### iTerm2
Download `Japanesque.itermcolors` from [GitHub](https://github.com/mbadolato/iTerm2-Color-Schemes),
and choose the theme.

TODO: Try to make it scripts.

### jasper
[Download the dark theme](https://github.com/jasperapp/jasper/tree/master/theme/dark).

*   Preferences
    *   General
        *   Browser - built-in
    *   Theme
        *   Main Theme - Load the dark theme.
        *   Broser Theme - DO NOT load the dark theme. It is bad to see.

### Karabiner
TODO: Research how to share profiles.

### terminal
*   Copy "Basic" profile as "My Basic", and configure it as below.
    *   Font: InconsolataForPowerline-dz 18pts

TODO: Try to make it scripts.

### Notation
Set bigger textsize as default.

### Virtual Box
Change the default VM folder path.

TODO: Try to make it scripts with using `defaults` command.

### Visual Studio Code
Use `Settings Sync`.
Enter `Shell Command: Install 'code' command in PATH` command
through the command palette.

### Vivaldi
Use [Vivaldi.net](https://vivaldi.net).
TODO: Detailed settings.

## Set up others.
### Lisp
#### atom-slime
1.  Check atom-slime's "Slime Path" setting.
2.  If the user name in the slime path is diffrent from my current machine's,
    give up syncronize settings and change slime path in the setting.
3.  `cd <parent folder of slime path>` and `hub clone slime/slime`.

TODO: Make it scripts.

### Node.js
1.  `mkdir -p ~/.nodebrew/src`
2.  `nodebrew install-binary stable`
3.  `nodebrew use stable`
4.  Execute `~/Configurations/bundle-npm-packages.sh` after deploying.

### Ruby gems
1.  Set up a Ruby environment (by using `rbenv`).
2.  `gem update` (then `gem cleanup`).
3.  If `bundle` command is not installed since using an old Ruby,
    `gem install bundler`
    If Ruby < 2.3.0., `gem install bundler -v 1.17.3`
4.  Move to `~/Configurations/gem` (after deploying), and `bundle update`
    (then `gem cleanup`).

NOTE: These gems are installed globally (per virtual environment).
We had better to install locally per project with
`bundle install --path=vendor/bundle` as much as we can,
because we can use `bundle clean` with project's bundle file.

TODO: Make it scripts.

### Python
1.  Set up a Python environment (by using `pyenv`).
2.  `pip install --upgrade pip`
3.  Move to `~/Configurations/pip` (after deploying), and `pip install -r requirements.txt`

### Haskell
0.  To reset, delete `~/.stack` directory.
1.  *   To install GHC for a project, move to the project directory, which
        contains `stack.yaml` file, and `stack setup`.
    *   To install the latest GHC without considering any certain project,
        `stack setup` at any directory which does not contain `stack.yaml`.
    *   TODO: To update GHC. (Edit `resolver` in `stack.yaml` in the project
        directory or `~/.stack/global-project`, and `stack setup` again?)
2.  Replace `~/.stack/config.yaml` by that of dotfiles with my `deploy` command.
3.  `~/Configurations/bundle-haskell-stack-packages.sh`

#### haskell-ide-engine
Build for each GHC version.
See [docs](https://github.com/haskell/haskell-ide-engine).
TODO: Make it scripts.

#### intero
Build for each GHC version.
See [docs](https://github.com/chrisdone/intero/blob/master/TOOLING.md).
TODO: Make it scripts.
