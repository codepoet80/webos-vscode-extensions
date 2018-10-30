#!/bin/bash
abs_path()
{
	echo "$(cd "${1%/*}" 2>/dev/null && echo "$PWD"/"${1##*/}")" || exit 1
}

where_am_i()
{
	local realme="$1"
	while [ -L "$realme" ]; do
		realme=`readlink "$realme"`
	done
	echo "$(cd "${realme%/*}" 2>/dev/null && pwd)" || exit 1
}

HERE="$(where_am_i "$0")"

if [[ "$@" =~ "new_app" ]]
then
    PROJECT_PATH="${@: -1}"
    if [ -d "$PROJECT_PATH" ]; then
        echo adding visualstudio code extensions
        SCRIPTS_DIR="$PROJECT_PATH/_scripts"
        BIN_DIR="$PROJECT_PATH/_bin"
        VSCODE_DIR="$PROJECT_PATH/.vscode"
        EXT_DIR="$(abs_path "$HERE/../vscode")"
        mkdir $SCRIPTS_DIR || true
        mkdir $BIN_DIR || true
        mkdir $VSCODE_DIR || true
        cp $EXT_DIR/_scripts/* $SCRIPTS_DIR
        cp $EXT_DIR/tasks.json $VSCODE_DIR
        #Tell OS to make scripts executable
        chmod +x $SCRIPTS_DIR/*.sh
    fi
fi