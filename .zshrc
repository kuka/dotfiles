#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export LANG=en_US.UTF-8

# aliases
alias vi="vim"
alias gst="git status"
alias ga="git add"
alias gr="git remote"
alias gc="git commit"
alias gdf="git diff"
alias gp="git push"
alias gl='git log --topo-order --pretty=format:"${_git_log_medium_format}"'

alias t='python ~/.tasks/sjl-t/t.py --task-dir ~/.tasks/list --list tasks --delete-if-empty'
alias tc='t | wc -l'
alias c='clear'
alias tmux='TERM=screen-256color-bce tmux'
alias wee='weechat'
alias mutt='neomutt'

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# rbenv
eval "$(rbenv init -)"

# fasd
eval "$(fasd --init auto)"

# term
set -o vi
set -o emacs

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/kuka/.repos/launchdeck/rabineImageProccessing/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/kuka/.repos/launchdeck/rabineImageProccessing/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/kuka/.repos/launchdeck/rabineImageProccessing/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/kuka/.repos/launchdeck/rabineImageProccessing/node_modules/tabtab/.completions/sls.zsh
###-begin-pm2-completion-###
### credits to npm for the completion file model
#
# Installation: pm2 completion >> ~/.bashrc  (or ~/.zshrc)
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _pm2_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           pm2 completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _pm2_completion pm2
elif type compctl &>/dev/null; then
  _pm2_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       pm2 completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _pm2_completion + -f + pm2
fi
###-end-pm2-completion-###
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:/usr/local/bin:/usr/local/opt/ruby/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/Applications/Racket v7.3/bin:$PATH"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$PATH"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U zmv
alias mmv='noglob zmv -W'
