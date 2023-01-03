# Manual

## Install applications.

*   ~~DB Browser for SQLite.app~~
*   ~~Eclipse.app~~
*   Google Drive.app
*   ~~IntelliJ IDEA CE.app~~
*   Karabiner
*   ~~PyCharm CE.app~~
*   [Stack](https://getstack.app/)
*   ~~Unity~~

## Through App Store.

*   ~~Alfred~~
    *   The App Store version seems to be old. Use the version installed by Homebrew Cask.
*   CotEditor
*   GIPHY Capture
*   Kindle
*   Line
*   Microsoft Office 365 (A bundle for Word, Excel, PowerPoint and Outlook)
*   Slack
*   The Unarchiver
*   TweetDeck
*   Xcode

### jar

*   ~~Automaton Simulator~~

### My scripts

TODO: Decide how share them.
*   Connect_with_iPhone.app
*   Google Chrome(fullscreen).app

## Install fonts.

Install with Homebrew Cask except below.
*   [Ricty](https://rictyfonts.github.io)

TODO: Make it scripts.

`Ricty` and `Ricty Diminished`'s backquote is broken.\
Run `~/Configurations/fix-ricty/fix-ricty.sh`.

## Set up GUI.

### Mac

*   Adjust brightness of display.
*   Change the computer name (and reboot?).
    ```
    sudo scutil --set LocalHostName *localhost name(ex.MBA-of-ikngtty)]*
    sudo scutil --set ComputerName *computer name(ex.MBA-of-ikngtty)*
    ```
*   Bluetooth
    *   Display on menubar.
*   Desktop and ScreenSaver
*   Dock
    *   Change position to left.
    *   Turn on to show/hide automatically.
    *   Adjust sizes.
    *   Change lineups. TODO: Descirbe.
*   General
    *   Make Vivaldi the default browser.
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
        *   Google IME
            *   Add all Google IME (Japanese and English) sources.
        *   Default
            *   Input Mode
                *   Enable all options.
*   Saving energy
    *   Do not darken when using a battery.
*   Security and Privacy
    *   The time require the password is right after sleeping and saving the screen.
*   Siri
    *   Turn off "Use 'Hey Siri'"
*   Sound
    *   Set always about showing sound on the menu bar
*   Trackpad
    *   Turn on `Application Expose`.
    *   Adjust sensitivity.
*   Finder
    *   General
        *   Start with the home folder.
        *   Turn off to open folder in new tab.
    *   Sidebar
        *   Add home and HDD.
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

### Insomnia

*   Interface Font Size - 16px
*   Text Editor Font - Ricty Diminished
*   Editor Font Size - 18px

TODO: Make it scripts.

### Karabiner

TODO: Research how to share profiles.

### terminal

*   Copy "Basic" profile as "My Basic", and configure it as below.
    *   Font: InconsolataForPowerline-dz 18pts

TODO: Try to make it scripts.

### Notes

Set bigger textsize as default.

### Virtual Box

Change the default VM folder path.

TODO: Try to make it scripts with using `defaults` command.

### Visual Studio Code

Use `Settings Sync`.

### Vivaldi

Sync settings via [Vivaldi.net](https://vivaldi.net).

Some settings are not synced by it, so they should be synced manually:

*   Appearance
    *   UI zoom rate - 110%
*   Theme
    *   Dark or Blueprint
*   Start page
    *   Background - (choose by my current mood)
    *   Speed dial's thumbnail size - small
*   Keyboard
    *   Developer tool console - empty
        *   Default setting is `⌃⇧J`, which also changes IME mode to Japanese.
*   Search
    *   Search engines
        *   duckduckgo.com
            *   `https://duckduckgo.com/?q=%s&t=h_`
            *   `d`
        *   Google
            *   `https://www.google.com/search?q=%s`
            *   `g`
        *   google.com
            *   `https://www.google.com/search?gl=us&hl=en&gws_rd=cr&pws=0&q=%s`
            *   `ge`
        *   ejje.weblio.jp
            *   `https://ejje.weblio.jp/content_find?query=%s&searchType=exact`
            *   `e`
        *   oxfordlearnersdictionaries.com
            *   `https://www.oxfordlearnersdictionaries.com/us/search/english/?q=%s`
            *   `ee`
        *   youtube.com
            *   `https://www.youtube.com/results?search_query=%s`
            *   `y`
        *   amazon.co.jp
            *   `https://www.amazon.co.jp/s/ref=nb_sb_noss?__mk_ja_JP=%E3%82%AB%E3%82%BF%E3%82%AB%E3%83%8A&url=search-alias%3Daps&field-keywords=%s`
            *   `a`
        *   twitter.com
            *   `https://twitter.com/search?q=%s`
            *   `t`
        *   hoogle.haskell.org
            *   `https://hoogle.haskell.org/?hoogle=%s&scope=set%3Astackage`
            *   `h`
*   Web page
    *   default zoom rate - 110%

TODO: Check untouhced detailed settings.

TODO: Make it scripts
NOTE:
*   `~/Library/Preferences/com.vivaldi.Vivaldi.plist`, which `defaults` command
    likely searches, contains trivial data. They don't likely contain settings
    that I want to sync.
*   According to `vivaldi://about/`, Vivaldi's profile is in
    `~/Library/Application Support/Vivaldi/Default`, but that directory has
    `README` and it says "Vivaldi settings and storage represent user-selected
    preferences and information and MUST not be extracted, overwritten or
    modified except through Vivaldi defined APIs.".
*   Does exist Vivaldi API? I've failed to find.
*   A GUI operation script may be ideal.

## Set up others.

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

#### haskell-language-server

Download binaries for each GHC version from its repository.
See [docs](https://github.com/haskell/haskell-language-server/).

The binaries should be executable (`chmod +x`) and be allowed by the macOS
security.

To let `haskell-language-server-wrapper` choose `haskell-language-server` for
the proper GHC version, the filename of `haskell-language-server` should be
`haskell-language-server-<GHC version>`.

TODO: Make it scripts.

#### intero

Build for each GHC version.
See [docs](https://github.com/chrisdone/intero/blob/master/TOOLING.md).
TODO: Make it scripts.

### Lisp

#### atom-slime

1.  Check atom-slime's "Slime Path" setting.
2.  If the user name in the slime path is diffrent from my current machine's,
    give up syncronize settings and change slime path in the setting.
3.  `cd <parent folder of slime path>` and `hub clone slime/slime`.

TODO: Make it scripts.

### Node.js

1.  `nodebrew setup_dirs` if not done ever
2.  `nodebrew install-binary stable`
3.  `nodebrew use stable`
4.  Execute `~/Configurations/bundle-npm-packages.sh` after deploying.

### Python

1.  Set up a Python environment (by using `pyenv`).
2.  `pip install --upgrade pip`
3.  Move to `~/Configurations/pip` (after deploying), and `pip install -r requirements.txt`

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
(The option `--path=vendor/bundle` can be omitted because it is configured
at the global config file, `~/.bundle/config`.)

TODO: Make it scripts.

### Rust

0.  install `rustup` via `Configrutions/Homebrew-Bundle/Brewfile`
1.  `rustup-init`
