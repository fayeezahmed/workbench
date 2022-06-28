# Workbench

This repo contains my standard tools so that I don't have to remember what I have to install each time on a new machine.

## Contents
1. [Tools](#tools)
2. [Start ZSH](#start-zsh)
3. [Tools to Install](#tools-to-install)
4. [Macros](#macros)
5. [Vim References](#references)

<a name="tools"></a>
## Tools
* Yabai
* Alacritty
* Spacebar
* Skhd
* Homebrew
* Vim
* Zshrc
* Tmux

<a name="start-zsh"></a>
## Start ZSH
To start zsh, use the following command:
* `zsh`

If you want to start it automatically, add this to your .bashrc:
```
# Launch ZSH automatically:
if [ -t 1 ]; then
    exec zsh
fi
```

<a name="tools-to-install"></a>
## Tools to install

### Homebrew
Install homebrew here: https://brew.sh/

### tmux
Install tmux plugin manager here: `https://github.com/tmux-plugins/tpm#installation`

### Plugin Manager
Uses Vim-Plug which automatically installs if it doesn't exist.

### VIM
Uses Neovim under the hood. Aliased `vim` to point to `nvim`

### Ag
Grep within files - follow these instructions: https://github.com/rking/ag.vim

### Install oh-my-zsh
You may have to install oh-my-zsh again if your terminal looks off, do this: 
`sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

Once you've done this, make sure you checkout the latest .zsh from this master since the above install will overwrite the file.

#### Theme
Install powerlevel 10k theme `https://github.com/romkatv/powerlevel10k#oh-my-zsh`
Then type `p10k configure` and follow instructions if you are new

#### Install zsh-syntax-highlighting
Do the following:
`git clone https://github.com/zsh-users/zsh-syntax-highlighting $HOME/`

### fshow()
To get fshow working - Follow install instructions here: https://github.com/junegunn/fzf

<a name="macros"></a>
## Macros

How to record a macro:
`q<letter><command>q` - `letter` is any letter from a-z to store into that register

### Window Management
Reference: https://cbrgm.net/post/2021-05-5-setup-macos/
This installs the following:
- yabai
- skhd
- spacebar
- alacr

Run: `./wm.sh`


### CSS Macros
*COMMENT CSS LINE* - `@c`
*UNCOMMENT CSS LINE* - `@v`
*HTML BOILERPLATE* - `@h`

<a name="references"></a>
## Vim References
- A quick tour of steve loshs massive vimrc
- Learn vim script the hard way 
- Practical VIM - Oreilly
- Modern VIM - Oreilly

