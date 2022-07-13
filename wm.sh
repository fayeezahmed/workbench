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
    if [ ! -z "$packagePath"]; then
      echo "Starting $packageName"
      brew install $packagePath
    fi
  fi
}

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
