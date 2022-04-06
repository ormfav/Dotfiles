source $ZDOTDIR/Themes/blox-zsh-theme/blox.zsh-theme
source $ZDOTDIR/Plugins/zsh-z.plugin.zsh
[[ -s /home/tlt/.autojump/etc/profile.d/autojump.sh ]] && source /home/tlt/.autojump/etc/profile.d/autojump.sh

setopt autocd # Automatically cd into typed directory.
stty stop undef # Disable ctrl-s to freeze terminal.
setopt interactive_comments

ENABLE_CORRECTION="true"

### Aliases and keybindings ###
source $ZDOTDIR/zsh-aliases

### tab completion ###
autoload -U compinit && compinit -u
fpath=($ZDOTDIR/zsh-completions/src $fpath)
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots) #Include hidden files.

### vi mode ###
[ -f "$ZDOTDIR/vim-mode" ] && . "$ZDOTDIR/vim-mode"

### functions ###
[ -f "$ZDOTDIR/zsh-functions" ] && . "$ZDOTDIR/zsh-functions"

### Syntax highlighting; should be last ###
source $ZDOTDIR/Plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh>/dev/null

eval $(thefuck --alias)
#(cat ~/.cache/wal/sequences &)
### Fancy graphycs on terminal opening ###
wal --preview | tail -n 3 | head -n 2

### PATH! ###
export PATH=$PATH:/home/tlt/.local/share/nvim/lsp_servers
export PATH=$PATH:/home/tlt/.local/bin
