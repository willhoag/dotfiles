test -e $HOME/.iterm2_shell_integration.fish ; and source $HOME/.iterm2_shell_integration.fish

export EDITOR="nvim"
export QUOTING_STYLE=literal

. ~/.config/fish/notes.fish
. ~/.config/fish/aliases.fish

if type -q nvm
    nvm use default
end


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/willhoag/.nvm/versions/node/v10.21.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish ]; and . /Users/willhoag/.nvm/versions/node/v10.21.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/willhoag/.nvm/versions/node/v10.21.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish ]; and . /Users/willhoag/.nvm/versions/node/v10.21.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish