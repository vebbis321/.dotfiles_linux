# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/supercharge"
plug "Aloxaf/fzf-tab"
plug "romkatv/powerlevel10k"
plug "jeffreytse/zsh-vi-mode"

# Load and initialise completion system
autoload -Uz compinit
compinit

#alias
alias nv, vim, vi ='nvim'
alias get_idf='. $HOME/Documents/Programming/C/Mylearning/ESP32_Course/esp-idf/export.sh'
alias cl ='clear'

source /usr/share/fzf/shell/key-bindings.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

clear-scrollback-and-screen () {
  zle clear-screen
}
zle -N clear-scrollback-and-screen
bindkey -v "^[o" clear-scrollback-and-screen
