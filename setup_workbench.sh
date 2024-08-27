#! /usr/local/bin bash

###
# Pre-requisites
###

echo "Updating package repository..."
sudo apt-get update
echo "..done"

echo "Installing pre-requisites..."
sudo apt install aptitude zsh
sudo aptitude install arandr
echo "..done"

###
# i3
###
echo "Installing i3 workspace manager..."

keyring_deb=$(wget -q -O- https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/ | grep -oP '(?<=href=")[^"]*_all\.deb')

/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/$keyring_deb keyring.deb SHA256:f9bb4340b5ce0ded29b7e014ee9ce788006e9bbfe31e96c09b2118ab91fca734

if [ -e "$keyring_deb" ]; then
    echo "File $keyring_deb exists."
else
    echo "File $keyring_deb does not exist."
fi

sudo apt install ./keyring.deb

echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
sudo apt update
sudo apt install i3

echo "...done"

###
# Polybar
###
echo "Installing Polybar next.."
echo "Installing build deps.."
sudo apt install dnf
sudo dnf install -y gcc-c++ clang git cmake @development-tools python3-sphinx python3-packaging

echo "Installing Polybar dependencies.."
sudo apt install build-essential git cmake cmake-data pkg-config python3-sphinx python3-packaging libuv1-dev libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev

echo "Installing optional dependencies for Polybar.."
sudo apt install libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev

echo "Going to build Polybar.."
git clone --recursive https://github.com/polybar/polybar
cd polybar
echo "Compiling and making Polybar.."
mkdir build
cd build
cmake ..
make -j$(nproc)
# Optional. This will install the polybar executable in /usr/bin
sudo make install
cd
echo "...done"


###
# Fonts
###
echo "Installing FontAwesome font.."
while true; do
    read -p "Open link to download font from the browser?" yn
    case $yn in
        [Yy]* ) open https://fontawesome.com/download; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
echo "Waiting for FontAwesome to download, continue when it's done"
while true; do
    read -p "Has the download completed?" yn
    case $yn in
        [Yy]* ) echo "User selected download completed, installing the font file"; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
if compgen -G $HOME/Downloads/fontawesome-free*.zip > /dev/null; then
    echo "Font awesome zip exists, unzipping.. "
    unzip "$HOME/Downloads/fontawesome-free*.zip" -d "$HOME/Downloads/fontawesome/"
    echo "Copying fonts to local .fonts dir.."
    mkdir -p $HOME/.fonts/
    cp $HOME/Downloads/fontawesome/*/otfs/*.otf $HOME/.fonts/
fi

echo "Reloading font cache"
sudo fc-cache -f -v

if fc-list | grep 'Font Awesome.*otf'; then
    echo "Font Awesome files look like they are installed, double check if they're the same ones installed.."
else
    echo "NOTE: No Font Awesome files are installed!"
fi

###
# Kitty
###
echo "Installing Kitty..."
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
echo "...done"

###
# Powerline
###
echo "Installing Powerline..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo "...done"

###
# ohmyzsh
###
echo "Installing ohmyzsh..."
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
echo "...done"


###
# NPM
###
echo "Installing NPM.."
echo "First installing nvm"
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
echo "Restarting shell"
source ~/.zshrc
echo "Now installing node via nvm"
nvm install node
echo "...done"

###
# NeoVim
###
echo "Installing NeoVim from source.."
sudo apt-get install ninja-build gettext cmake unzip curl build-essential
echo "Cloning repo"
git clone https://github.com/neovim/neovim
cd neovim && sudo make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb
cd
echo "...done"

###
# RipGrep
###
echo "Installing RipGrep.."
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb
sudo dpkg -i ripgrep_14.1.0-1_amd64.deb
echo "...done"

###
# Xclip
###
sudo apt-get install ripgrep

###
# Scrot
###
echo "Installing scrot..."
sudo apt install scrot
echo "...done"

###
# Brightnessctl
###
sudo apt install brightnessctl

###
# LazyGit
###
echo "Installing LazyGit..."
cd
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
cd
echo "...done"

###
# Java
###
echo "Follow the steps on README to setup Java and JDTLS"

echo "Restarting shell after everything has installed"
zsh
echo "Workbench setup..!"







