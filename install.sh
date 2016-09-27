#!/bin/zsh
platform="`uname`"

# Mac specifc bits
if [[ "$platform" == "Darwin" ]]; then
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	if [[ ! -d "/usr/local/Cellar/wget/" ]]; then	
			brew install wget
	fi
	if [[ ! -d "/usr/local/git" ]]; then
			cd ~/Downloads
			if [[ ! -f "git-2.5.0.dmg" ]]; then
				wget http://sourceforge.net/projects/git-osx-installer/files/git-2.5.0-intel-universal-mavericks.dmg -O git-2.5.0.dmg
			fi
			hdiutil mount git-2.5.0.dmg
			git_install=$(`hdiutil info | grep /Volumes/Git | cut -f 3-`)
			if [[ -d "$git_install" ]]; then
					git_installer = `ls "$git_install/*.pkg"`
					sudo installer -package $git_install/$git_installer -target "/Volumes/Macintosh HD"
					hdiutil unmount `hdiutil info | grep /Volumes/Git | cut -f -1`
			fi
	fi
	if [[ ! -d "/usr/local/Cellar/git-flow-avh" ]]; then
			brew install git-flow-avh
	fi
	if [[ ! -d "/usr/local/Cellar/git-open" ]]; then
			brew install git-open
	fi
	home="~"
else
	home="/home/`whoami`"
	
	# Install powerline fonts
	wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
	sudo mv PowerlineSymbols.otf /usr/share/fonts/
	sudo fc-cache -vf
	sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
fi

# Make repos dir in user
if [[ ! -d "$home/Repos" ]]; then
	mkdir -p "$home/Repos"
fi

# Get common settings
common="$home/Repos/Common-Settings"
git clone https://github.com/StummeJ/CommonSettings.git $common
cp "$common/.vim/" "$home"
ln -sf "$home/.vim/Config/.vimrc $home/.vimrc"

# Get oh my zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
sh -c "$(wget https://raw.github.com/powerline/fonts/master/install.sh -O -)"
cp "$common/.zshrc" "$home/"

# Get vim plugins
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp -r "$common/.vim" "$home/"
vim +PluginInstall +qall

# Set zsh as default shell
chsh -s /bin/zsh
