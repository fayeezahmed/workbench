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

function checkBrew(){
  which -s brew
  if [[ $? != 0 ]] ; then
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    brew update
  fi
}

function outputStatusMsg() {
  statusMsg=$1
  echo "$(tput setaf 6) $(tput setab 0)...$statusMsg......."
}

function getPackageManager(){
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    local pkgManager=apt
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    local pkgManager=brew
  fi
}

##########
## BREW ##
##########
outputStatusMsg "CHECKING BREW"
checkBrew

##########################################
## OH MY ZSH && ZSH SYNTAX HIGHLIGHTING ##
##########################################
outputStatusMsg "CHECKING ZSH SYNTAX HIGHLIGHTING"
brew install zsh-syntax-highlighting
git checkout ~/.zshrc

####################
## POWERLEVEL 10K ##
####################
outputStatusMsg "CHECKING P10K THEME FOR ZSH"
brew install romkatv/powerlevel10k/powerlevel10k
STRING="powerlevel10k/powerlevel10k.zsh-theme"
if  grep -q $STRING ~/.zshrc ; then
  echo "$(tput setaf 3) Already inserted \"source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme\"" ; 
else
  echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
fi


############
## NEOVIM ##
############
outputStatusMsg "CHECKING NEOVIM"
installPackage neovim neovim

###########
## YABAI ##
###########
outputStatusMsg "CHECKING YABAI"
installPackage yabai koekeishiya/formulae/yabai

##########
## SKHD ##
##########
outputStatusMsg "CHECKING SKHD"
installPackage skhd koekeishiya/formulae/skhd

##############
## SPACEBAR ##
##############
# Leaving spacebar commented incase I use linux
#installPackage spacebar cmacrae/formulae/spacebar
outputStatusMsg "CHECKING FONT AWESOME"
brew install homebrew/cask-fonts/font-fontawesome

######################
## KITTY - Terminal ##
######################
outputStatusMsg "CHECKING KITTY"
brew install --cask kitty


###########
## STATS ##
###########
outputStatusMsg "CHECKING STATS - ram cpu icons for menu bar"
echo "https://github.com/exelban/stats"
brew install --cask stats

#########
## NVM ##
#########
outputStatusMsg "CHECKING NVM & NODE"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR=$HOME/.nvm;
source $NVM_DIR/nvm.sh;
# install latest version of node at least
nvm install node


#########
## FZF ##
#########
outputStatusMsg "CHECKING FZF"
brew install fzf
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

##########
## yarn ##
##########
outputStatusMsg "CHECKING YARN & NPM"
curl -o- -L https://yarnpkg.com/install.sh | bash

