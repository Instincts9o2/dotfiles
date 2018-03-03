# Setup fzf
# ---------
if [[ ! "$PATH" == */home/instincts/.fzf/bin* ]]; then
  export PATH="$PATH:/home/instincts/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/instincts/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/instincts/.fzf/shell/key-bindings.bash"

