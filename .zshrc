emulate sh -c '. ~/.profile'
emulate zsh

if [[ ~/zshrc/*.zshrc ]]; then
    for FILE in ~/zshrc/*.zshrc; do
            source $FILE
    done
fi
