#!/bin/bash

source_dir=`pwd`
dotfiles_dir=`dirname $0`
certs_dir=""
choice="0"

select_terminal() {
  echo "Which shell do you want to use?"
  echo "  1 - zsh"
  echo "  2 - bash"
  echo ""
  read choice

  if [ "$choice" == "1" ]; then
    echo "Installing zsh"
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
  elif [ "$choice" == "2" ]; then
    echo "Installing bash"
  fi
}

copy_files() {
  if [ "$choice" == "1" ]; then
    cp $dotfiles_dir/zshrc ~/.zshrc
  elif [ "$choice" == "2" ]; then
    cp $dotfiles_dir/bashrc ~/.bashrc
    cp $dotfiles_dir/inputrc ~/.inputrc
  fi

	cp $dotfiles_dir/gitconfig ~/.gitconfig
}

dotfiles_dir_finder() {
  out=`cd $dotfiles_dir 2> lock; pwd`
	contents=`cat $source_dir/lock`

  if [ "$contents" == "" ]; then
		dotfiles_dir=$out

		rm "$source_dir/lock"
	fi
}

replace_tokens() {
  if [ "$choice" == 1 ]; then
	  sed -i -e "s,__DOTFILEPATH__,$dotfiles_dir,g" ~/.zshrc
  elif [ "$choice" == 2 ]; then
	  sed -i -e "s,__DOTFILEPATH__,$dotfiles_dir,g" ~/.bashrc
  fi
}

install_certs() {
	mkdir ~/.certs

	valid=false

	while [[ $valid != true ]]; do
		echo "Where are your certificates located?"
		read certs

		out=`cd $certs 2> lock; pwd`
		contents=`cat $source_dir/lock`

		if [ "$contents" == "" ]; then
			certs_dir=$out

			rm "$source_dir/lock"
			valid=true
		fi
	done

	cp "$certs_dir/*" ~/.certs/
}

select_terminal
dotfiles_dir_finder
copy_files
replace_tokens
install_certs
