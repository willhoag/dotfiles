eval (/opt/homebrew/bin/brew shellenv)

export EDITOR="vim"
export QUOTING_STYLE=literal

. ~/.config/fish/notes.fish
. ~/.config/fish/aliases.fish

fish_vi_key_bindings

# Fixes gpg needed for signing commits in git (not sure why the need for this extra step)
export GPG_TTY=(tty)
