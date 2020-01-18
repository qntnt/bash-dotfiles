if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

function _workspace() {
	ROOT_PATH="$HOME"
	WORKSPACES_PATH="workspaces"
	PROJECT_PATH=""
	while getopts ":r:w:p:" opt; do
		case $opt in
			r) ROOT_PATH="$OPTARG";;
			w) WORKSPACES_PATH="$OPTARG";;
			p) PROJECT_PATH="$OPTARG";;
			\?) echo "Invalid option -$OPTARG" >&2
		esac
	done
	echo "ROOT       = $ROOT_PATH"
	echo "WORKSPACES = $WORKSPACES_PATH"
	echo "PROJECT    = $PROJECT_PATH"

	FULL_PATH="$ROOT_PATH/$WORKSPACES_PATH/$PROJECT_PATH/"
	
	if (cd "$FULL_PATH"); 
	then
		echo "$FULL_PATH"
	else
		echo command returned some error
		read -p "Would you like to create this directory? (Y/n) " should_create
		should_create=${should_create:-Y}
		if [ "$should_create" == "Y" ] || [ "$should_create" == "y" ]
		then 
			mkdir "$FULL_PATH"
			echo "$FULL_PATH"
		else 
			echo "Ok, no workspace created."
		fi		
	fi
}

function workspace() {
	while getopts ":r:w:p:" opt; do
		case $opt in
			r) ROOT_PATH="$OPTARG";;
			w) WORKSPACES_PATH="$OPTARG";;
			p) PROJECT_PATH="$OPTARG";;
			\?) echo "Invalid option -$OPTARG" >&2
		esac
	done
	echo $(_workspace -r $ROOT_PATH -w $WORKSPACES_PATH -p $PROJECT_PATH | tail -1) | cd
}


export PATH=$PATH:/Users/quentintopper/workspaces/emsdk:/Users/quentintopper/workspaces/emsdk/upstream/emscripten:/Users/quentintopper/workspaces/emsdk/node/12.9.1_64bit/bin
