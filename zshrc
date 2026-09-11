export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh
source ~/bin/variables.sh
source ~/.zshenv.sh
alias vactivate='source .venv/bin/activate'

export PATH=$PATH:/home/gaskia/.spicetify

. "$HOME/.local/share/../bin/env"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
. /usr/share/nvm/init-nvm.sh

# >>> android autocomplete >>>
#compdef android

_android_complete() {
    local -a completions
    local output
    output=$(android --complete "${words[@]:1:$CURRENT-1}" 2>/dev/null)
    if [[ -n "$output" ]]; then
        completions=(${(z)output})
        compadd -a completions
    fi
}
compdef _android_complete android
# <<< android autocomplete <<<
