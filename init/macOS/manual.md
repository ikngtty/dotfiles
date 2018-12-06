# Manual
## Install applications.
*   (comment out) DB Browser for SQLite.app
*   (comment out) Discord.app
*   (comment out) Eclipse.app
*   Google Drive.app
*   (comment out) IntelliJ IDEA CE.app
*   Karabiner
*   Kindle.app
*   LINE.app
*   (comment out) PyCharm CE.app
*   (comment out) Racket v7.1
*   Slack.app
*   TweetDeck.app
*   (comment out) Unity
*   (comment out) Visual Studio Code.app

### jar
*   (comment out) Automaton Simulator

### My scripts
TODO: Decide how share them.
*   Connect_with_iPhone.app
*   Google Chrome(fullscreen).app

## Install fonts.
*   [Ricty Diminished](https://www.rs.tus.ac.jp/yyusa/ricty_diminished.html)
*   [Ricty](https://www.rs.tus.ac.jp/yyusa/ricty.html)
    *   [Inconsolata](https://fonts.google.com/specimen/Inconsolata)
    *   [Migu 1M](http://mix-mplus-ipa.osdn.jp/)
*   [Inconsolata-dz for Powerline](https://github.com/powerline/fonts)
*   Osaka-Mono (Mac has it by default.)

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
    *   The time require the password is right after sleeping and saving the scrreen.
*   Keyboard
    *   Make function keys default.
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
*   Desktop and ScreenSaver

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

# CotEditor
1.  Download themes from [here](https://github.com/naotaka/CotEditor-themes).
2.  Make CotEditor read them at `settings` window. (Then they can be deleted.)

*   Display
    *   Font -> Ricty Diminished 20pts
    *   Theme -> base16-Monokai.dark

TODO: Make it scripts.

### Fish
Use `fish_config` command.
*   colors -> Choose `Tomorrow Night Bright` theme.

### Google IME
TODO:

### iTerm2
Use the feature to load preferences.
My preference is saved in `$HOME/Configurations/iTerm2` after deploying.

TODO: Try to make it scripts with using `defaults` command.

### Karabiner
Need not to share.

### terminal
TODO:

### MacDown
*   Editor
    *   Font -> Ricty Diminshed 24pts
    *   Theme -> Tomorrow+ (default)
*   Rendering
    *   CSS -> GitHub2_edited TODO: Make font size bigger.
    *   Turn on reflection breaklines.

TODO: Try to make it scripts with using `defaults` command.

### Virtual Box
Change the default VM folder path.

TODO: Try to make it scripts with using `defaults` command.

### Vivaldi
Use [Vivaldi.net](https://vivaldi.net).
TODO: Detailed settings.

## Set up others.
### Node.js
1.  `mkdir -p ~/.nodebrew/src`
2.  `nodebrew install-binary stable`
3.  `nodebrew use stable`

### npm
*   `npm i -g yarn`

### Ruby gems
1.  Set up a Ruby environment (by using `rbenv`).
2.  `gem update` (then `gem cleanup`).
3.  `gem i bundler` (then `rbenv hash`? Check [this tip](https://qiita.com/tokimari/items/51ac63a1fe244b819aea)).
4.  Move to `~/Configurations/gem` (after deploying), and `bundle install`.

NOTE: These gems are installed globally (per virtual environment).
We had better to install locally per project with
`bundle install --path=vendor/bundle` as much as we can,
because we can use `bundle clean` with project's bundle file.

TODO: Decide to use `bundle install` or `bundle update`.

TODO: Install `rbenv-binstubs` and use `bundle install`
with `--binstubs=bundle_bin`.

TODO: Make it scripts.

### OPAM
TODO: Make it scripts.
*   ocp-indent
*   merlin
*   utop
