function installPackage(){
  packageName=$1
  packagePath=$2

  echo "packageName: $packageName"
  echo "packagePath: $packagePath"
  if brew ls --versions $packageName > /dev/null; then
    # The package is installed
    brew services start $packagePath
  else
    # The package is not installed
    echo "$packageName is already installed!"
    if [ ! -z "$packagePath" ]; then
      echo "Starting $packageName"
      brew install $packagePath
    fi
  fi
}

##########
## BREW ##
##########
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

##########################################
## OH MY ZSH && ZSH SYNTAX HIGHLIGHTING ##
##########################################
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew install zsh-syntax-highlighting

####################
## POWERLEVEL 10K ##
####################
brew install romkatv/powerlevel10k/powerlevel10k

############
## NEOVIM ##
############
installPackage neovim neovim

###########
## YABAI ##
###########
installPackage yabai koekeishiya/formulae/yabai

##########
## SKHD ##
##########
installPackage skhd koekeishiya/formulae/skhd

##############
## SPACEBAR ##
##############
installPackage spacebar cmacrae/formulae/spacebar
brew install homebrew/cask-fonts/font-fontawesome

##########################
## ALACRITTY - Terminal ##
##########################
brew install --cask alacritty


##########################
## KITTY - Terminal ##
##########################
brew install --cask kitty
