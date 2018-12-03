# Manual
## Install applications.
TODO: Try to use `brew cask`.
*   Alfred.app
*   AppCleaner.app
*   Atom.app
*   CheatSheet.app
*   Clipy.app
*   CotEditor.app
*   Cyberduck.app
*   (comment out) DB Browser for SQLite.app
*   (comment out) Discord.app
*   (comment out) Eclipse.app
*   GIMP.app
*   Google Chrome.app
*   Google Drive.app
*   Grammarly.app
*   ImageOptim.app
*   (comment out) IntelliJ IDEA CE.app
*   Karabiner-Elements.app
*   Kindle.app
*   LINE.app
*   MacDown.app
*   Microsoft Office
*   Microsoft Teams
*   (comment out) PyCharm CE.app
*   (comment out) Racket v7.1
*   Slack.app
*   SourceTree.app
*   TweetDeck.app
*   (comment out) Unity
*   Vagrant
*   VirtualBox.app
*   (comment out) Visual Studio Code.app
*   Vivaldi.app
*   iTerm.app

### jar
*   (comment out) Automaton Simulator

### My scripts
TODO: Decide how share them.
*   Connect_with_iPhone.app
*   Google Chrome(fullscreen).app

## Mac
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

TODO: Try to make it scripts with using `defaults` command.

## Install fonts.
*   Ricty Diminished
*   Ricty
*   Inconsolata-dz for Powerline
*   Osaka-Mono

TODO: Make it scripts.

## Google IME
TODO:

## terminal
TODO:

## iTerm2
Use the feature to load preferences.
My preference is saved in `$HOME/Configurations/iTerm2` after deploying.

TODO: Try to make it scripts with using `defaults` command.

## Alfred
*   General
    *   I'm in Japan.
*   Appearane
    *   Choose the `Frosty Teal` theme.

## Fish
Use `fish_config` command.
*   colors -> Choose `Tomorrow Night Bright` theme.

## Atom
Use `Sync Settings` package.
Follow my comment in `init.coffee`.
TODO: Make it scripts.
TODO: Find out steps to create Lisp IDE.

## Vivaldi
Use [Vivaldi.net](https://vivaldi.net).
TODO: Detailed settings.

## Ruby gems
1.  Set up a Ruby environment (by using `rbenv`).
2.  `gem update` (then `gem cleanup`).
3.  `gem i bundler` (then `rbenv hash`? Check [this tip](https://qiita.com/tokimari/items/51ac63a1fe244b819aea)).
4.  Move to `$HOME/Configurations/gem` (after deploying), and `bundle install`.

NOTE: These gems are installed globally (per virtual environment).
We had better to install locally per project with
`bundle install --path=vendor/bundle` as much as we can,
because we can use `bundle clean` with project's bundle file.

TODO: Decide to use `bundle install` or `bundle update`.

TODO: Install `rbenv-binstubs` and use `bundle install`
with `--binstubs=bundle_bin`.

TODO: Make it scripts.

## OPAM
TODO: Make it scripts.
*   ocp-indent
*   merlin
*   utop

## Virtual Box
Change the default VM folder path.

TODO: Try to make it scripts with using `defaults` command.

## MacDown
*   Editor
    *   Font -> 18pts
    *   Theme -> Tomorrow+
*   Rendering
    *   CSS -> GitHub2_edited
    *   Turn on reflection breaklines.

TODO: Try to make it scripts with using `defaults` command.

## Karabiner
Need not to share.
