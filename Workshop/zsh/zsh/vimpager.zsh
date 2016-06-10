# Использование vimpager вместо того, чтобы less
# поиск vimpager
if which vimpager &> /dev/null; then
    export PAGER="vimpager"
else
    export PAGER="$HOME/.zsh/bin/vimpager"
fi
alias less="$PAGER"
alias zless="$PAGER"

