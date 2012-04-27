#!/bin/bash

source_dir=`pwd`
dotfiles_dir=""
certs_dir=""
choice="0"

select_terminal() {
  echo "Which shell do you want to use?"
  echo "\t1 - zsh"
  echo "\t2 - bash"
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
    cp zshrc ~/.zshrc
  elif [ "$choice" == "2" ]; then
    cp bashrc ~/.bashrc
    cp inputrc ~/.inputrc
  fi

	cp gitconfig ~/.gitconfig
}

ask_for_dotfiles_dir() {
	valid=false

	while [[ $valid != true ]]; do
		echo "Where is your dotfiles repository located?"
		read dotfiles

		out=`cd $dotfiles 2> lock; pwd`
		contents=`cat $source_dir/lock`

		if [ "$contents" == "" ]; then
			dotfiles_dir=$out

			rm "$source_dir/lock"
			valid=true
		fi
	done

  if [ "$choice" == 1 ]; then
	  sed -i -e "s,__DOTFILEPATH__,$dotfiles_dir,g" ~/.zshrc
  elif [ "$choice" == 2 ]; then
	  sed -i -e "s,__DOTFILEPATH__,$dotfiles_dir,g" ~/.bashrc
  fi
}

install_certs() {
	mkdir "~/.certs"

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

select_terminal()
copy_files
ask_for_dotfiles_dir
install_certs
