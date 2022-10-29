#!/bin/bash

CYAN=`tput setaf 6`
RED=`tput setaf 1`
RESET=`tput sgr0`
BOLD=`tput bold`

function tellMe() {
	echo ""
	echo -e "${BOLD}${RED}*************************************************************"
	echo -e "${CYAN}$1"
	echo -e "${RED}*************************************************************${RESET}"
	echo ""
}

function runUpdates() {
	tellMe "GETTING UPDATE INFO"
	sudo apt-get update
	tellMe "UPDATING APPS"
	sudo apt-get -y upgrade
	tellMe "UPDATING SYSTEM"
	sudo apt-get -y dist-upgrade
	tellMe "UPDATING SNAP PACKAGES"
	sudo snap refresh
	tellMe "UPDATING FLATPAK PACKAGES"
	sudo flatpak update
}


function cleanup() {
	tellMe "REMOVING UNUSED DEPENDENCIES"
	sudo apt -y autoremove
	tellMe "REMOVING ANY PARTIAL PACKAGES" 
	sudo apt autoclean
	tellMe "CLEANING APT CACHE"
	sudo apt clean
}

function runExtras() {
  # Put whatever extra scripts you want here
  # these will run last
	tellMe "CHECKING ANALOGUE POCKET UPDATES"
	node ~/code/PERSONAL_GL/pocket-update-notifier/index.mjs
	tellMe "FETCHING WEATHER"
	curl wttr.in/<your_city_here>
  # example: curl wttr.in/boston
}

function askCleanup() {
	while true; do
		tellMe "CLEANUP STUFF"
	    read -p "Do you wish to cleanup unused dependencies and cache? " yn
	    case $yn in
	        [Yy]* ) cleanup; break;;
	        [Nn]* ) break;;
	        * ) echo "Please answer (y)es or (n)o.";;
	    esac
	done	
}

runUpdates
askCleanup
runExtras
exit 