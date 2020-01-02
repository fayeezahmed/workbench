# Workbench

This repo contains my standard tools so that I don't have to remember what I have to install each time on a new machine.

## Tools
* Vim
* Zshrc
* Tmux

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

### Install oh-my-zsh
You may have to install oh-my-zsh again if your terminal looks off, do this: 
`sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

Once you've done this, make sure you checkout the latest .zsh from this master since the above install will overwrite the file.

## Macros

How to record a macro:
`q<letter><command>q` - `letter` is any letter from a-z to store into that register

### CSS Macros
*COMMENT CSS LINE* - `@c`
*UNCOMMENT CSS LINE* - `@v`

## Vim References
- A quick tour of steve loshs massive vimrc
- Learn vim script the hard way 
