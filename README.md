# Workbench

This repo contains my standard tools so that I don't have to remember what I have to install each time on a new machine.

## Contents
1. [Tools](#tools)
2. [Start ZSH](#start-zsh)
3. [Tools to Install](#tools-to-install)
4. [SSH](SSH)
5. [Macros](#macros)
6. [Vim References](#references)

<a name="tools"></a>

## Installation
Run:
```zsh
./wm.sh
```
This will install the following:
- Homebrew
- OH MY ZSH & ZSH SYNTAX HIGHLIGHTING
- Powerlevel 10k
- Neovim
- Yabai
- SKHD
- Spacebar
- Fontawesome
- Kitty
- Stats
- NVM & Node
- FZF

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

## SSH

Usually I have multiple github users, one for work and one for personal. There are a few things to do to make sure this works with this setup.

1. Create multiple SSH keys [here|https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent]
2. Add all the keys to the ssh-agent like so:
  1. `ssh-add -k ~/.ssh/private_key`
3. Create an ssh config file under `~/.ssh/config` and paste the following information (replace the templated []):
   ```javascript
  # Default Config - Work profile
  Host work
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519
    IdentitiesOnly yes
 
  # Secondary Config - Personal profile
  Host personal
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed_personal
    IdentitiesOnly yes

   ```
4. When cloning a git repository instead of doing this:
`git clone git@github.com:fayeezahmed/workbench.git`

Do this (replace the github.com with the Host in above ssh config):
`git clone git@personal:fayeezahmed/workbench.git`

5. If I've already cloned it, do the following:

```zsh
# rename it so it's easier to reference and so you don't forget where it's from
git remote rename origin workbench
git remote set-url workbench git@personal:fayeezahmed/workbench.git`

```

References:
- https://jeffbrown.tech/multiple-github-accounts-ssh/
- https://superuser.com/questions/232373/how-to-tell-git-which-private-key-to-use

## Macros

How to record a macro:
`q<letter><command>q` - `letter` is any letter from a-z to store into that register

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

