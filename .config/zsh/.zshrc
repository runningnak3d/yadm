export XDG_DATA_HOME=$HOME/.local/share
#export XDG_RUNTIME_DIR=$XDG_DATA_HOME/var/run/$UID
export XDG_BIN_HOME=$HOME/.local/bin
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
export HISTFILE=$XDG_STATE_HOME/zsh/history
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/.vimrc" | source $MYVIMRC'
export LANG=en_US.UTF-8
export PYTHONSTARTUP=$XDG_CONFIG_HOME/python/pythonrc
export GOPATH=$XDG_DATA_HOME/go

export AWS_SHARED_CREDENTIALS_FILE="$XDG_DATA_HOME"/aws/credentials
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config
export SCREENRC=$XDG_CONFIG_HOME/screen/screenrc
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/.gtkrc-2.0
export CARGO_HOME=$XDG_DATA_HOME/cargo
export XINITRC=$XDG_CONFIG_HOME/X11/xinitrc
alias wget="wget --hsts-file=$XDG_DATA_HOME/wget/wget-hsts"
export GNUPGHOME=$XDG_DATA_HOME/gnupg
export RANDFILE=$XDG_DATA_HOME/rand/randfile
export ELINKS_CONFDIR=$XDG_CONFIG_HOME/elinks
export XINITRC=$XDG_CONFIG_HOME/X11/xinitrc
export ERRFILE=$XDG_CACHE_HOME/X11/xsession-errors
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc

export QT_QPA_PLATFORMTHEME=gtk2

echo ""
echo ""
# fortune | cowsay -f bud-frogs | lolcat
if [ -d /usr/share/cowsay/cows ]
then
	COWDIR='/usr/share/cowsay/cows'
else
	COWDIR='/usr/share/cows'
fi
#fortune | cowsay -f $(ls /usr/share/cowsay/cows/ || ls /usr/share/cows | shuf -n1) 2>&1 | lolcat
fortune | cowsay -f $(ls $COWDIR | shuf -n1) | lolcat
echo ""
echo ""
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH
export LIB=lib
export FZF_BASE=/usr/share/doc/fzf

zmodload zsh/zpty

# Path to your oh-my-zsh installation.
export ZSH="$XDG_DATA_HOME"/oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="random"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$XDG_DATA_HOME/oh-my-zsh/custom

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(fzf-tab fzf screen nmap npm node pip zsh-autosuggestions aws battery git command-not-found common-aliases sudo systemd zsh-syntax-highlighting history-substring-search)


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   #export EDITOR='mvim'
   export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vi="vim"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

# xrdm Xresource database manager
export XRDM_DIR=$XDG_CONFIG_HOME/X11/Xresources.d
export XRDM_FONT_DIR=$XRDM_DIR/fonts
export XRDM_COLOR_DIR=$XRDM_DIR/colors
export XRDM_PRESET_DIR=$XRDM_DIR/presets
export XRDM_PROGRAM_DIR=$XRDM_DIR/programs

# Let's source some crap
source $ZSH/oh-my-zsh.sh
#source /usr/share/doc/pkgfile/command-not-found.zsh
#source ~/liquidprompt/liquidprompt
#source $ZSH/aws_zsh_completer.sh
source $XDG_BIN_HOME/xrdm
xrdm color nord2

# Liquidprompt
#LP_PS1_PREFIX="╔═╡"
#LP_PS1_POSTFIX=$'\n'"╚══⮀ "
#LP_PS1_PREFIX="╭┌	┌┌"
#LP_PS1_POSTFIX=$'\n'"⤷ "

## Custom stuff
url() {
    links -g http://$1 ;
}

extract() {
    if [ -z ${1} ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
        echo "Usage: extract <archive> [directory]"
        echo "Example: extract presentation.zip."
        echo "Valid archive types are:"
        echo "tar.bz2, tar.gz, tar.xz, tar, bz2, gz, tbz2,"
        echo "tbz, tgz, lzo, rar, zip, 7z, xz, txz, lzma and tlz"
    else
        case "$1" in
            *.tar.bz2|*.tbz2|*.tbz)         tar xvjf "$1" ;;
            *.tgz)                          tar zxvf "$1" ;;
            *.tar.gz)                       tar xvzf "$1" ;;
            *.tar.xz)                       tar xvJf "$1" ;;
            *.tar)                          tar xvf "$1" ;;
            *.rar)                          7z x "$1" ;;
            *.zip)                          unzip "$1" ;;
            *.7z)                           7z x "$1" ;;
            *.lzo)                          lzop -d  "$1" ;;
            *.gz)                           gunzip "$1" ;;
            *.bz2)                          bunzip2 "$1" ;;
            *.Z)                            uncompress "$1" ;;
            *.xz|*.txz|*.lzma|*.tlz)        xz -d "$1" ;;
            *) echo "Sorry, '$1' could not be decompressed." ;;
        esac
    fi
}

getnews () {
    curl https://newsapi.org/v2/top-headlines -s -G -d sources=$1 -d \ 
    apiKey=409a83ab553f44459b7fbdfec4ce4639 | jq -r '.articles[] | .title, .url, ""'
}

weather() {
    curl -4 -s "http://wttr.in/Pinellas%20Park,FL" | head -n -1;
}

export username=runningnak3d
export ircname=runningnka3d
export nick=rnshell
export target=#lglaf
#export server="localhost 55555"
export ircserver="irc.freenode.net 6667"

my_irc() {
    tmp=`mktemp`; cat > $tmp; { echo -e "USER $username x x    \
    :$ircname\nNICK $nick\nJOIN $target"; while read line; do  \
    echo -e "PRIVMSG $target :$line"; done < $tmp; } | nc      \
    $ircserver > /dev/null ; rm $tmp;
}

# AWS stuff
asp swango
export RPS1="$(aws_prompt_info)"

PATH="/home/swango/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/swango/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/swango/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/swango/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/swango/perl5"; export PERL_MM_OPT;
setopt no_share_history
unsetopt share_history
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ${ZDOTDIR:-~}/.p10k.zsh ]] || source ${ZDOTDIR:-~}/.p10k.zsh
#source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#PROG=$($HOME/dev/xtmon/xtmon &)
export ORACLE_HOME=$HOME/oracle
# Linuxbrew
#eval $(~/.linuxbrew/bin/brew shellenv)
#eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"
#source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
unalias g
DISABLE_MAGIC_FUNCTIONS=true
# Disable zsh-autocompletion on paste
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

 pastefinish() {
   zle -N self-insert $OLD_SELF_INSERT
 }
 zstyle :bracketed-paste-magic paste-init pasteinit
 zstyle :bracketed-paste-magic paste-finish pastefinish
 ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=6'
 [ -f ~/.fzf.zsh ] && source $HOME/.fzf.zsh
 FZF_DEFAULT_OPTS='--height 75% --ansi'
 FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
 [ -e ~/.dircolors ] && eval $(dircolors -b ~/.dircolors) || eval $(dircolors -b)


#source $HOME/.lxc.completion.zsh
#compdef _lxc lxc

bindkey "\e[1;3C" forward-word
bindkey "\e[1;3D" backward-word

eval "$(zoxide init zsh)"
alias ls='exa -hg --icons --octal-permissions'
alias cat='bat'

function inject-cmd-output() {
  emulate -L zsh
  local out
  # Invoke `echo "hello world"` (can use any command here).
  out=$(pwd 2>/dev/null) || return
  BUFFER+=$out
  if [[ $KEYMAP == vicmd && -n $BUFFER ]]; then
    CURSOR=$(($#BUFFER - 1))
  else
    CURSOR=$#BUFFER
  fi
}

zle -N inject-cmd-output

# Bind to Ctrl-T.
bindkey '^D^T' inject-cmd-output

# emojis in stderr
#export LD_PRELOAD=/home/swango/dev/libemotify-stderr/build/libemotify-stderr.so
#export EMOTIFY_REACTS=1
