#!/bin/zsh
platform = `uname`

# Mac specifc bits
if ["$platform" == "Darwin"]; then
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	if [ ! -d "/usr/local/Cellar/wget/" ]; then	
			brew install wget
	fi
	if [ ! -d "/usr/local/git" ]; then
			cd ~/Downloads
			if [ ! -f "git-2.5.0.dmg" ]; then
				wget http://sourceforge.net/projects/git-osx-installer/files/git-2.5.0-intel-universal-mavericks.dmg -O git-2.5.0.dmg
			fi
			hdiutil mount git-2.5.0.dmg
			git_install = `hdiutil info | grep /Volumes/Git | cut -f 3-`
			if [ -d "$git_install" ]; then
					git_installer = `ls "$git_install/*.pkg"`
					sudo installer -package $git_install/$git_installer -target "/Volumes/Macintosh HD"
					hdiutil unmount `hdiutil info | grep /Volumes/Git | cut -f -1`
			fi
	fi
	if [ ! -d "/usr/local/Cellar/git-flow-avh" ]; then
			brew install git-flow-avh
	fi
	if [ ! -d "/usr/local/Cellar/git-open" ]; then
			brew install git-open
	fi
fi

# Make repos dir in user
if [ ! -d "~/Repos" ]; then
	mkdir -p "~/Repos"
fi

# Get common settings
common = "~Repos/Common-Settings"
git clone https://github.com/StummeJ/CommonSettings.git $common

# Get oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
sh -c "$(curl -fsSL https://raw.github.com/powerline/fonts/master/install.sh)"
cp "$common/.zshrc" "~/"

# Get vim plugins
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp "$common/.vim" "~/"
vim +PluginInstall +qall

