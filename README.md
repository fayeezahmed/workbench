# Workbench

This repo contains my standard tools so that I don't have to remember what I have to install each time on a new machine.

## Setup

Clone the repo:
`git clone git@github.com:fayeezahmed/workbench.git`

Move all files including hidden into the home dir:
`cp -rf workbench/. .`

## Pre-req installation

`sudo apt install aptitude`
`sudo aptitude install arandr`
`sudo apt install zsh`

### i3
Install i3 from Ubuntu [here](https://i3wm.org/docs/repositories.html)

Install feh - `sudo apt install feh`

### Picom
#### Pre-req

### Polybar
`sudo apt install polybar` - if using Ubuntu 24. If not compile and install from source:
https://github.com/polybar/polybar/wiki/Compiling#dependencies

Read the [Getting started guide](https://github.com/polybar/polybar/wiki)

Download and build from source [here](https://github.com/yshui/picom)

For the necessary build tools, use `sudo apt install **paste the libs here**`

#### Fonts
Install Font Awesome fonts here: 
https://fontawesome.com/download

Copy the font files to ~/.fonts/

Reload the fonts:
`sudo fc-cache -f -v`

Double check the fonts exist with:
`fc-list | grep 'Font Awesome*.otf'`

### Kitty
`curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin`

### Powerline
`git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k`

Then restart your zsh:
`zsh`

### ohmyzsh
Follow the manual instructions:
https://github.com/ohmyzsh/ohmyzsh?tab=readme-ov-file#manual-installation

### npm
Install nvm first:
`curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash`

Restart the shell: `zsh`

Install node:
`nvm install node`

### Neovim
Manual install:

1. [Pre-req](https://github.com/neovim/neovim/blob/master/BUILD.md#build-prerequisites)
2. [Build from source](https://github.com/neovim/neovim/blob/master/BUILD.md)

Make sure to run sudo in build step.

Restart the shell with `zsh`

Load up neovim: `nvim`

#### RipGrep
Install ripgrep:
https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation

`sudo apt-get install ripgrep`

#### Install Xclip for copy/paste on nvim
`sudo apt install xclip`

## Other

### Screenshots pre-req

Install scrot:
`sudo apt install scrot`

### Brightnessctl
`sudo apt install brightnessctl`

### LazyGit
Install Ubuntu instructions: 
[LazyGit instructions](https://github.com/jesseduffield/lazygit?tab=readme-ov-file#ubuntu)

## Java

Download JDTLS from:
https://github.com/eclipse-jdtls/eclipse.jdt.ls

Extract the download and update the jdtls path in the jdtls.lua config in neovim

Download JavaSE-* and place the path in the runtimes (not the java bin).

Then in the `cmd` for `start_and_attach` add the actual binary path there.

Add the java bin to the $PATH


## Useful Vim things

## Macros

How to record a macro:
`q<letter><command>q` - `letter` is any letter from a-z to store into that register

### CSS Macros
*COMMENT CSS LINE* - `@c`
*UNCOMMENT CSS LINE* - `@v`
*HTML BOILERPLATE* - `@h`

## Vim References
- A quick tour of steve loshs massive vimrc
- Learn vim script the hard way 
- Practical VIM - Oreilly
- Modern VIM - Oreilly
- https://jeffbrown.tech/multiple-github-accounts-ssh/
- https://superuser.com/questions/232373/how-to-tell-git-which-private-key-to-use

