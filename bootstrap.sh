#!/bin/bash

source_dir=`pwd`
dotfiles_dir=''
certs_dir=''

copy_files() {
	cp bashrc ~/.bashrc
	cp inputrc ~/.inputrc
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

	sed -i -e "s,__DOTFILEPATH__,$dotfiles_dir,g" ~/.bashrc
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

copy_files
ask_for_dotfiles_dir
install_certs