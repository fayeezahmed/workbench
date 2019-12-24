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
## Macros

How to record a macro:
`q<letter><command>q` - `letter` is any letter from a-z to store into that register

## Vim References
- A quick tour of steve loshs massive vimrc
- Learn vim script the hard way 
