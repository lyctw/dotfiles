# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/yc/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages zsh-autosuggestions fast-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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

alias cp='cp -Rv'
alias ls='ls --color=auto -ACF'
alias ll='ls --color=auto -alF'
alias grep='grep --color=auto'
alias mkdir='mkdir -pv'
alias mv='mv -v'
alias wget='wget -c'
alias tmux='tmux -u' # UTF-8 support

# Use programs without a root-equivalent group
alias docker='sudo docker'
# alias npm='sudo npm'

function cd () {
    builtin pushd "$@" > /dev/null
    # Show contents of dir after action
    ls -ACF
}

function popd() {
    # Suppress the output of popd by redirecting it to /dev/null
    builtin popd "$@" > /dev/null
    # Show contents of dir after action
    ls -ACF
}

function fdtdiff() {
    if [ $# -ne 2 ]; then
        echo "Usage: fdtdiff <file1> <file2>"
        echo "  Files must be .dtb or .dts files (can be mixed)"
        return 1
    fi

    local file1="$1"
    local file2="$2"
    local ext1="${file1##*.}"
    local ext2="${file2##*.}"
    local temp_dir=$(mktemp -d)
    local dts1="${temp_dir}/file1.dts"
    local dts2="${temp_dir}/file2.dts"

    # Process first file
    if [ "$ext1" = "dtb" ]; then
        dtc -I dtb -O dts -o "$dts1" "$file1"
    elif [ "$ext1" = "dts" ]; then
        # DTS file: Convert to DTB and then to DTS for normalization
        local dtb1="${temp_dir}/file1.dtb"
        dtc -I dts -O dtb -o "$dtb1" "$file1"
        dtc -I dtb -O dts -o "$dts1" "$dtb1"
    else
        echo "Error: First file must be .dtb or .dts format"
        rm -rf "$temp_dir"
        return 1
    fi

    # Process second file
    if [ "$ext2" = "dtb" ]; then
        dtc -I dtb -O dts -o "$dts2" "$file2"
    elif [ "$ext2" = "dts" ]; then
        # DTS file: Convert to DTB and then to DTS for normalization
        local dtb2="${temp_dir}/file2.dtb"
        dtc -I dts -O dtb -o "$dtb2" "$file2"
        dtc -I dtb -O dts -o "$dts2" "$dtb2"
    else
        echo "Error: Second file must be .dtb or .dts format"
        rm -rf "$temp_dir"
        return 1
    fi

    # Check if difft is available, otherwise use diff
    if command -v difft &> /dev/null; then
        difft "$dts1" "$dts2"
    else
        diff -u "$dts1" "$dts2"
    fi

    rm -rf "$temp_dir"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# command-line fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Fast Syntax Highlighting (F-Sy-H) 
source ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
