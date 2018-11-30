# Manual
## Install fonts.
**TODO**

## iTerm
Use the feature to load preferences.
My preference is saved in `$HOME/Configurations/iTerm2` after deploying.

## Fish
Use `fish_config` command.
*   colors -> Choose `Tomorrow Night Bright` theme.

## Fisherman
**TODO**

## Atom
Use `Sync Settings` package.
Follow my comment in `init.coffee`.
TODO: Make it scripts.

## Vivaldi
### Settings
**TODO**

### Bookmark
**TODO**

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

## MacDown
*   Editor
    *   Font -> 18pts
    *   Theme -> Tomorrow+
*   Rendering
    *   CSS -> GitHub2_edited
    *   Turn on reflection breaklines.

## Karabiner
Need not to share.
