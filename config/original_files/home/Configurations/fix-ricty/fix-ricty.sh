#!/bin/sh
set -Ceu
if set -o | grep pipefail >/dev/null 2>&1; then
  set -o pipefail
else
  printf "$(echo '<red>WARNING: Cannot use pipefail option.</red>' |
    sed -e 's/<red>/\\e\[31m/g' -e 's/<\/red>/\\e\[m/g'
    )"
  printf "\r\n"
fi

# Check Requirements.
if ! which fontforge >/dev/null 2>&1; then
  printf "\e[31m"                   # Red
  printf "Cannot run! Please install "
  printf "\e[1mfontforge\e[m"       # Bold and reset
  printf "\e[31m"                   # Red again
  printf "!"
  printf "\e[m\n"                   # Reset
  exit 10
fi

font_path="$HOME/Library/Fonts" # HACK: cannot get via any command ?
fix() {
  font_filename=$1
  printf "\e[36m"         # Magenta
  printf "Fix $font_filename ..."
  printf "\e[m\n"         # Reset
  # TODO: check file existing and ignore non-existing file
  fontforge -lang ff -script "fix-ricty.ff" "$font_path/$font_filename"
}
fix Ricty-Bold.ttf
fix Ricty-BoldOblique.ttf
fix Ricty-Oblique.ttf
fix Ricty-Regular.ttf
fix RictyDiscord-Bold.ttf
fix RictyDiscord-BoldOblique.ttf
fix RictyDiscord-Oblique.ttf
fix RictyDiscord-Regular.ttf
fix RictyDiminished-Bold.ttf
fix RictyDiminished-BoldOblique.ttf
fix RictyDiminished-Oblique.ttf
fix RictyDiminished-Regular.ttf
fix RictyDiminishedDiscord-Bold.ttf
fix RictyDiminishedDiscord-BoldOblique.ttf
fix RictyDiminishedDiscord-Oblique.ttf
fix RictyDiminishedDiscord-Regular.ttf
