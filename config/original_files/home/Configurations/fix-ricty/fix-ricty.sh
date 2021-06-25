#!/bin/sh
set -Ceu
if set -o | grep pipefail >/dev/null 2>&1; then
  set -o pipefail
else
  >&2 printf "$(echo '<red>WARNING: Cannot use pipefail option.</red>' |
    sed -e 's/<red>/\\e\[31m/g' -e 's/<\/red>/\\e\[m/g'
    )"
  >&2 printf "\r\n"
fi

# Check Requirements.
if ! which fontforge >/dev/null 2>&1; then
  >&2 printf "\e[31m"                   # Red
  >&2 printf "Cannot run! Please install "
  >&2 printf "\e[1mfontforge\e[m"       # Bold and reset
  >&2 printf "\e[31m"                   # Red again
  >&2 printf "!"
  >&2 printf "\e[m\n"                   # Reset
  exit 10
fi

font_folder_path="$HOME/Library/Fonts" # HACK: cannot get via any command ?
fix() {
  font_file_name=$1
  font_file_path="$font_folder_path/$font_file_name"
  if [ ! -f "$font_file_path" ]; then
    printf "\e[33m"         # Yellow
    printf "Cannot find $font_file_name."
    printf "\e[m\n"         # Reset
  else
    printf "\e[36m"         # Magenta
    printf "Fix $font_file_name ..."
    printf "\e[m\n"         # Reset
    fontforge -lang ff -script "fix-ricty.ff" "$font_file_path"
  fi
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
