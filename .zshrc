emulate sh -c '. ~/.profile'
emulate zsh

if [[ ~/zshrc/*.zshrc ]]; then
    for FILE in ~/zshrc/*.zshrc; do
        source $FILE
        # Check if the last command was successful
        if [[ $? -ne 0 ]]; then
            echo "Error sourcing $FILE. Exiting."
            exit 1
        fi
        echo "$FILE loaded"
    done
fi
