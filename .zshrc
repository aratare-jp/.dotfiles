# Start tmux on startup
if [[ -z "$INTELLIJ_ENVIRONMENT_READER" ]] && command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux new-session -A -s main
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
ZSH_THEME="powerlevel10k/powerlevel10k"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load common modules
for f in $(ls -d ~/.zsh.d/common/*); do source $f; done

# Load modules based on OS
if [[ $OSTYPE == 'darwin'* ]]; then
    for f in $(ls -d ~/.zsh.d/macos/*); do source $f; done
else
    for f in $(ls -d ~/.zsh.d/linux/*); do source $f; done
fi

# Load local modules
if [[ -f ~/.local.zsh.d ]]; then
    for f in $(ls -d ~/.local.zsh.d/*); do source $f; done 
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

