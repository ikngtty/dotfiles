# Manual
## iTerm
Use the feature to load preferences.
My preference is saved in `$HOME/Configurations/iTerm2` after deploying.

## Ruby gems
1.  Set up a Ruby environment (by using `rbenv`).
2.  `gem update` (then `gem cleanup`).
3.  `gem i bundler` (then `rbenv hash`? Check [this tip](https://qiita.com/tokimari/items/51ac63a1fe244b819aea)).
4.  Move to `$HOME/Configurations/gem` (after deploying), and `bundle install`.

NOTE: These gems are installed globally (by each virtual environment).
We had better to install locally by each project with
`bundle install --path=vendor/bundle` as much as we can,
because we can use `bundle clean` with project's bundle file.

TODO: Decide to use `bundle install` or `bundle update`.

TODO: Install `rbenv-binstubs` and use `bundle install`
with `--binstubs=bundle_bin`.

TODO: Make it scripts.
