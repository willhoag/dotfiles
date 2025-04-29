# use coreutils ls
# group by directories first
# write human readable file sizes
if test -e /opt/homebrew/bin/gls
    alias ls='/opt/homebrew/bin/gls --color -h --group-directories-first'
end

alias o open

# https://formulae.brew.sh/formula/thefuck
thefuck --alias | source

function reload-config
    source ~/.config/fish/config.fish
end

function hint -a tool
    # "https://raw.github.com/hazeorid/devhints.io/gh-pages/$tool.md"
    open https://devhints.io/$tool
end

# tmux
function tma -a name
    if test -z "$name"
        set name main
    end
    tmux new-session -A -s $name
end

# alias neovim
command -v nvim >/dev/null; and begin
    alias vim nvim
end

# irc chat
command -v weechat >/dev/null; and begin
    alias irc weechat
end

# emacs
command -v emacs >/dev/null; and begin
    function em
        emacsclient -t $argv; or begin
            emacs --daemon; and emacsclient -t $argv
        end
    end
end

if type notes >/dev/null
    alias n notes
end

# edit
function e
    eval $EDITOR $argv
end

# dotfiles management
function dotfiles
    if test -n "$GIT_DIR" -o -n "$GET_WORK_TREE"
        set -ge GIT_DIR
        set -ge GIT_WORK_TREE
    else
        set -gx GIT_DIR $HOME/.git-dotfiles/
        set -gx GIT_WORK_TREE $HOME
    end
    true
end

function fish-k8s
    set -g theme_display_k8s_context $argv
end

function list_rename -a delimiter -a fileName -d "Rename multiple files from a multiline \$file where before and after are separated by a \$delimiter. Required Args: \$delimeter \$file"
    sed 's/^/mv -vi "/;s/'$delimiter'/" "/;s/$/";/' <$fileName | bash
end

# alias for dictionary lookups
alias define sdcv

alias uid 'uuidgen | tr -d '-' | tr A-Z a-z'

# Turn on and off terminal wrap
alias wrap-on 'tput rmam'
alias wrap-off 'tput smam'

# greeting
# cowfortune () {
#     if [ -x /usr/local/bin/cowsay -a -x /usr/local/bin/fortune ]; then
#        fortune | cowsay -f (ls /usr/local/share/cows/ | gshuf -n1)
#     fi
# }

# Load a .env file
alias env.load 'export (cat .env | xargs)'

# npm
alias ni 'npm install'
alias nis 'npm install --save'
alias nid 'npm install --save-dev'
alias nig 'npm install --global'
alias nt 'npm test'
alias nit 'npm install; and npm test'
alias nk 'npm link'
alias nr 'npm run'
alias nf 'npm cache clean; and rm -rf node_modules; and yarn install'

# docker
alias d docker
alias dm docker-machine
alias dc docker-compose
alias dcl docker-clean
alias dl "docker ps -l -q"
alias dps "docker ps"
alias dpa "docker ps -a"
alias di "docker images"
alias dip "docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias drd "docker run -d -P"
alias dri "docker run -it -P"
alias dex "docker exec -it"

# Stop all containers
alias dstop 'docker stop (docker ps -a -q)'

# Remove all containers
alias drmca 'docker rm (docker ps -a -q)'

# Stop and Remove all containers
alias drmf 'docker stop (docker ps -a -q); and docker rm (docker ps -a -q)'

# Remove all images
alias drmia 'docker rmi (docker images -q)'

function dmenv
    eval (docker-machine env $argv)
end

# Dockerfile build, e.g., $dbu tcnksm/test
function dbu -a name
    docker build -t=$name
end

# Show all alias related docker
function dalias
    alias | grep docker | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/" | sed "s/['|\']//g" | sort
end

# Bash into running container
function dbash -a name
    docker exec -it (docker ps -aqf "name=$name") bash
end

alias km minikube
alias k kubectl
function kmenv
    eval (minikube docker-env); and export DOCKER_MACHINE_NAME="minikube"
end

alias ghc 'gh repo create --private --source=. --remote=origin && git push -u --all && gh browse'

# Git log colors.
# https://github.com/sorin-ionescu/prezto/blob/master/modules/git/alias.zsh
set _git_log_medium_format '%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'
set _git_log_oneline_format '%C(green)%h%C(reset) %s%C(red)%d%C(reset)%n'
set _git_log_brief_format '%C(green)%h%C(reset) %s%n%C(blue)(%ar by %an)%C(red)%d%C(reset)%n'
set _git_status_ignore_submodules none

alias g git

# Branch (b)
alias gb 'git branch'
alias gbc 'git checkout -b'
alias gbl 'git branch -v'
alias gbL 'git branch -av'
alias gbx 'git branch -d'
alias gbX 'git branch -D'
alias gbm 'git branch -m'
alias gbM 'git branch -M'
alias gbs 'git show-branch'
alias gbS 'git show-branch -a'

# Commit (c)
alias gc 'git commit --verbose'
alias gca 'git commit --verbose --all'
alias gcm 'git commit --message'
alias gco 'git checkout'
alias gcO 'git checkout --patch'
alias gcf 'git commit --amend --reuse-message HEAD'
alias gcF 'git commit --verbose --amend'
alias gcp 'git cherry-pick --ff'
alias gcP 'git cherry-pick --no-commit'
alias gcr 'git revert'
alias gcR 'git reset "HEAD^"'
alias gcs 'git show'
alias gcl git-commit-lost

# Conflict (C)
alias gCl 'git status | sed -n "s/^.*both [a-z]*ed: *//p"'
alias gCa 'git add (gCl)'
alias gCe 'git mergetool (gCl)'
alias gCo 'git checkout --ours --'
alias gCO 'gCo (gCl)'
alias gCt 'git checkout --theirs --'
alias gCT 'gCt (gCl)'

# Data (d)
alias gd 'git ls-files'
alias gdc 'git ls-files --cached'
alias gdx 'git ls-files --deleted'
alias gdm 'git ls-files --modified'
alias gdu 'git ls-files --other --exclude-standard'
alias gdk 'git ls-files --killed'
alias gdi 'git status --porcelain --short --ignored | sed -n "s/^!! //p"'

# Fetch (f)
alias gf 'git fetch'
alias gfc 'git clone'
alias gfm 'git pull'
alias gfr 'git pull --rebase'

# Grep (g)
alias gg 'git grep'
alias ggi 'git grep --ignore-case'
alias ggl 'git grep --files-with-matches'
alias ggL 'git grep --files-without-matches'
alias ggv 'git grep --invert-match'
alias ggw 'git grep --word-regexp'

# Index (i)
alias gia 'git add'
alias giA 'git add --patch'
alias giu 'git add --update'
alias gid 'git diff --no-ext-diff --cached'
alias giD 'git diff --no-ext-diff --cached --word-diff'
alias gir 'git reset'
alias giR 'git reset --patch'
alias gix 'git rm -r --cached'
alias giX 'git rm -rf --cached'

# Log (l)
alias gl 'git log --topo-order --pretty=format:"$_git_log_medium_format"'
alias gls 'git log --topo-order --stat --pretty=format:"$_git_log_medium_format"'
alias gld 'git log --topo-order --stat --patch --full-diff --pretty=format:"$_git_log_medium_format"'
alias glo 'git log --topo-order --pretty=format:"$_git_log_oneline_format"'
alias glg 'git log --topo-order --all --graph --pretty=format:"$_git_log_oneline_format"'
alias glb 'git log --topo-order --pretty=format:"$_git_log_brief_format"'
alias glc 'git shortlog --summary --numbered'

# Merge (m)
alias gm 'git merge'
alias gmC 'git merge --no-commit'
alias gmF 'git merge --no-ff'
alias gma 'git merge --abort'
alias gmt 'git mergetool'

# Push (p)
alias gp 'git push'
alias gpf 'git push --force'
alias gpa 'git push --all'
alias gpA 'git push --all; and git push --tags'
alias gpt 'git push --tags'
alias gpc 'git push --set-upstream origin "(git-branch-current 2> /dev/null)"'
alias gpp 'git pull origin "(git-branch-current 2> /dev/null)"; and git push origin "(git-branch-current 2> /dev/null)"'

# Rebase (r)
alias gr 'git rebase'
alias gra 'git rebase --abort'
alias grc 'git rebase --continue'
alias gri 'git rebase --interactive'
alias grs 'git rebase --skip'

# Remote (R)
alias gR 'git remote'
alias gRl 'git remote --verbose'
alias gRa 'git remote add'
alias gRx 'git remote rm'
alias gRm 'git remote rename'
alias gRu 'git remote update'
alias gRp 'git remote prune'
alias gRs 'git remote show'
alias gRb git-hub-browse

# Stash (s)
alias gs 'git stash'
alias gsa 'git stash apply'
alias gsx 'git stash drop'
alias gsX git-stash-clear-interactive
alias gsl 'git stash list'
alias gsL git-stash-dropped
alias gsd 'git stash show --patch --stat'
alias gsp 'git stash pop'
alias gsr git-stash-recover
alias gss 'git stash save --include-untracked'
alias gsS 'git stash save --patch --no-keep-index'
alias gsw 'git stash save --include-untracked --keep-index'

# Submodule (S)
alias gS 'git submodule'
alias gSa 'git submodule add'
alias gSf 'git submodule foreach'
alias gSi 'git submodule init'
alias gSI 'git submodule update --init --recursive'
alias gSl 'git submodule status'
alias gSm git-submodule-move
alias gSs 'git submodule sync'
alias gSu 'git submodule foreach git pull origin master'
alias gSx git-submodule-remove

# Working Copy (w)
alias gws 'git status --ignore-submodules="$_git_status_ignore_submodules" --short'
alias gwS 'git status --ignore-submodules="$_git_status_ignore_submodules"'
alias gwd 'git diff --no-ext-diff'
alias gwD 'git diff --no-ext-diff --word-diff'
alias gwr 'git reset --soft'
alias gwR 'git reset --hard'
alias gwc 'git clean -n'
alias gwC 'git clean -f'
alias gwx 'git rm -r'
alias gwX 'git rm -rf'
