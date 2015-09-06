#!/bin/bash

BASE_DIR=$(dirname $0)
PLUGIN="auto-comment"

# select plugin path

PS3="Do you agree to install ~/.emacs.d/plugins?[1/2]"
options=("yes" "no")

select opt in "${options[@]}"; 
do
case $opt in 
	"yes")
		PLUGIN_PATH="$HOME/.emacs.d/plugins";
		break;;
	"no")
		read -p "Please enter the path where the plugin is installed\n" CUSTOM_PATH;
		PLUGIN_PATH=$CUSTOM_PATH;
		break;;

	*)
		echo "Invalid option";;
esac
done

echo -e "This script will install plugins on $PLUGIN_PATH";
mkdir -p $PLUGIN_PATH
cp -r $BASE_DIR/auto-comment $PLUGIN_PATH

echo -e "This script will configure your ~/.emacs"
echo -e "(add-to-list 'load-path \"$PLUGIN_PATH/$PLUGIN\")" >> ~/.emacs
echo -e "(require '$PLUGIN)" >> ~/.emacs

#append script in .emacs

echo -e "Installtion is commplete!!\n"
echo -e "usage) M-x insert-daily-report"
echo -e "       M-x insert-file-summary"
echo -e "       M-x insert-code-review"

echo -e ""

echo -e "If you want to add this function emacs keymap"
echo -e "Append .emacs file this code."
echo -e "\t (global-set-key [f2] \'insert-daily-report)"
