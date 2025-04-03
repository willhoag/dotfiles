# Unset the default fish greeting
functions -e fish_greeting

eval (/opt/homebrew/bin/brew shellenv)

if test -e /opt/homebrew/bin/starship
    starship init fish | source
end

fnm env --use-on-cd | source

set theme_color_scheme dracula

# Fixes gpg needed for signing commits in git (not sure why the need for this extra step)
export GPG_TTY=(tty)
export EDITOR="vim"
export QUOTING_STYLE=literal
export NOTES_FOLDER="/Users/willhoag/Documents/notes/"

. ~/.config/fish/notes.fish
. ~/.config/fish/aliases.fish

fish_vi_key_bindings

# Only auto-launch tmux if we're not already in tmux
if not set -q TMUX
    tma
end
