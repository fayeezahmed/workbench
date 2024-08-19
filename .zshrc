emulate sh . ~/.profile
emulate zsh
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.config/sdkman/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

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
# DISABLE_AUTO_UPDATE="true"

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    jsontools
    macos
    node
    docker
)

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
# ALIASES ARE DEFINED IN $ZSH_CUSTOM/fayeez_custom/aliases.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
if [ -f ~/.zsh/zsh_gr ]; then
  source ~/.zsh/zsh_gr
else 
  print "[INFO]: No zsh_gr found in .zsh dir."
fi

if [ -f ~/.zsh/zsh_aliases ]; then
  source ~/.zsh/zsh_aliases
else 
  print "[INFO]: No zsh_aliases found in .zsh dir."
fi


#### FAYEEZ START

if [ -z "$SSH_AUTH_SOCK" ] ; then
    eval "$(ssh-agent -s)"
    ssh-add /home/fayeez.ahmed/.ssh/id_ed25519
fi

export SSH_ASKPASS=/usr/bin/ssh-askpass

# Vim keybindings
set -o vi

export VSCODE="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export ANDROID_HOME="/Users/fayeezahmed/Library/Android/sdk"
export ANDROID_SDK_ROOT=$ANDROID_HOME
export ANDROID_SDK_TOOLS=$HOME/Library/Android/sdk/tools/
export ANDROID_SDK_PLATFORM_TOOLS=$HOME/Library/Android/sdk/platform-tools/
export TIZEN_STUDIO=/Users/fayeez.ahmed/tizen-studio/

export PATH=$XCODE:$VSCODE:$ANDROID_HOME:$ANDROID_SDK_TOOLS:$ANDROID_SDK_PLATFORM_TOOLS:$HOME/bin:/usr/local/bin:$TIZEN_STUDIO/tools:$TIZEN_STUDIO/tools/ide/bin:$PATH

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
#. "/usr/local/opt/nvm/nvm.sh"
ZSH_DISABLE_COMPFIX=true

# Colorise the top Tabs of Iterm2 with the same color as background
# Just change the 18/26/33 wich are the rgb values 
echo -e "\033]6;1;bg;red;brightness;18\a"
echo -e "\033]6;1;bg;green;brightness;26\a"
echo -e "\033]6;1;bg;blue;brightness;33\a"
# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/fayeez.ahmed/v5/packages/wdio-lambda-runner/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/fayeez.ahmed/v5/packages/wdio-lambda-runner/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/fayeez.ahmed/v5/packages/wdio-lambda-runner/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/fayeez.ahmed/v5/packages/wdio-lambda-runner/node_modules/tabtab/.completions/sls.zsh
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

############################################################################################################################################
### ----------------------------------------------- FAYEEZ ZSHRC CUSTOM STUFF GOES HERE -----------------------------------------------  ###
############################################################################################################################################

### CUSTOM FUNCTIONS START ### 
# Find and open file with vim
function ofv(){
  if [ -z "$1" ] 
  then 
    echo "Please specify file name"
   else
        vim $(find . -path ./node_modules -prune -o -name "$1" -print)
   fi
}

# Interactive git diff
function fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" \
  | fzf --ansi --preview "echo {} \
    | grep -o '[a-f0-9]\{7\}' \
    | head -1 \
    | xargs -I % sh -c 'git show --color=always %'" \
        --bind "enter:execute:
            (grep -o '[a-f0-9]\{7\}' \
                | head -1 \
                | xargs -I % sh -c 'git show --color=always % \
                | less -R') << 'FZF-EOF'
            {}
FZF-EOF"
}

function fshowReverse() {
  git log --reverse --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" \
  | fzf --ansi --preview "echo {} \
    | grep -o '[a-f0-9]\{7\}' \
    | head -1 \
    | xargs -I % sh -c 'git show --color=always %'" \
        --bind "enter:execute:
            (grep -o '[a-f0-9]\{7\}' \
                | head -1 \
                | xargs -I % sh -c 'git show --color=always % \
                | less -R') << 'FZF-EOF'
            {}
FZF-EOF"
}
### CUSTOM FUNCTIONS END ###

setopt cdablevars
pp=~/playground/personal-projects
wpp=/mnt/c/Development
ctags=/usr/local/bin/ctags

### RANDOM OR FUN THINGS START ###
matrix() { echo -e "\e[1;40m" ; clear ; while :; do echo $LINES $COLUMNS $(( $RANDOM % $COLUMNS)) $(( $RANDOM % 72 )) ;sleep 0.05; done|awk '{ letters="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%^&*()"; c=$4;        letter=substr(letters,c,1);a[$3]=0;for (x in a) {o=a[x];a[x]=a[x]+1; printf "\033[%s;%sH\033[2;32m%s",o,x,letter; printf "\033[%s;%sH\033[1;37m%s\033[0;0H",a[x],x,letter;if (a[x] >= $1) { a[x]=0; } }}' }

disappointed() { echo -n " ಠ_ಠ " |tee /dev/tty| xclip -selection clipboard; }

flip() { echo -n "（╯°□°）╯ ┻━┻" |tee /dev/tty| xclip -selection clipboard; }

shrug() { echo -n "¯\_(ツ)_/¯" |tee /dev/tty| xclip -selection clipboard; }
### RANDOM OR FUN THINGS END ###
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### TMUX colours to work ###
export TERM=xterm-256color

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


### Autload NVM to the right version
# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

#### RENAME FILE EXTENSIONS
autoload -U zmv
# you don't need the following two now, but put them also in your .zshrc
# aliased in $ZSH_CUSTOM/fayeez_custom/aliases.zsh
# Usage (ext1 and ext2 are the file extensions you swap out): 
# zmv '^*.ext1' '$f.ext2'
#### FAYEEZ END


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export MAVEN_HOME=/usr/local/share/apache-maven-3.8.8/
PATH="$MAVEN_HOME/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.config/sdkman"
[[ -s "$HOME/.config/sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.config/sdkman/bin/sdkman-init.sh"

export MAVEN_OPTS='-Xmx512m -Xms512m'

bindkey '^R' history-incremental-search-backward
bindkey '^S' history-search-forward

export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
bindkey -v
export PATH="/home/fayeez.ahmed/git-fuzzy/bin:$PATH"

# Scala for gatling
export SCALA_HOME=/usr/local/share/scala-2.12.18/

export PATH="$PATH:$SCALA_HOME/bin"
export PATH="$PATH:/home/fayeez.ahmed/.local/share/coursier/bin"


# JDTLS
export PATH="$PATH:/home/fayeez.ahmed/Downloads/jdtls/bin/:/usr/lib/jvm/java-21-amazon-corretto/"


PATH="/home/fayeez.ahmed/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/fayeez.ahmed/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/fayeez.ahmed/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/fayeez.ahmed/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/fayeez.ahmed/perl5"; export PERL_MM_OPT;
