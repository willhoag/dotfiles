test -e $HOME/.iterm2_shell_integration.fish ; and source $HOME/.iterm2_shell_integration.fish

export EDITOR="nvim"
export QUOTING_STYLE=literal

. ~/.config/fish/notes.fish
. ~/.config/fish/aliases.fish

if type -q nvm
    nvm use default
end

