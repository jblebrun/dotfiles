if [[ -z "$LOCAL_PREFIX" ]] then
    echo "Make a local .zshrc, set LOCAL_PREFIX, and source this file."
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source "$LOCAL_PREFIX"/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if type brew &>/dev/null; then
    FPATH="$LOCAL_PREFIX"/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

source $LOCAL_PREFIX/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
