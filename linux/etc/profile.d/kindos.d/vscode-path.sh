
# DESCRIPTION: Adds Windows VSCode to path if it exists

VSCODE_PATH="$USERPROFILE/AppData/Local/Programs/Microsoft VS Code/bin"


[[ -d "$VSCODE_PATH" ]] &&export PATH=$PATH:"$USERPROFILE/AppData/Local/Programs/Microsoft VS Code/bin"
