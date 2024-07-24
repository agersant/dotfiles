{ pkgs, ... }:

let

keybindings = [
	{
		key = "ctrl+d";
		command = "editor.action.copyLinesDownAction";
		when = "editorTextFocus";
	}
	{
		key = "shift+ctrl+d";
		command = "editor.action.deleteLines";
		when = "editorTextFocus";
	}
	{
		key = "shift+ctrl+up";
		command = "editor.action.moveLinesUpAction";
		when = "editorTextFocus";
	}
	{
		key = "shift+ctrl+down";
		command = "editor.action.moveLinesDownAction";
		when = "editorTextFocus";
	}
	{
		key = "ctrl+q";
		command = "editor.action.commentLine";
		when = "editorTextFocus";
	}
	{
		key = "ctrl+shift+u";
		command = "editor.action.transformToUppercase";
		when = "editorTextFocus";
	}
	{
		key = "ctrl+u";
		command = "editor.action.transformToLowercase";
		when = "editorTextFocus";
	}
	{
		key = "f4";
		command = "editor.action.revealDefinition";
		when = "editorHasDefinitionProvider && editorTextFocus && !isInEmbeddedEditor";
	}
	{
		key = "shift+f4";
		command = "workbench.action.navigateBack";
		when = "editorTextFocus";
	}
];

userSettings = {
	"editor.minimap.enabled" = false;
	"editor.scrollBeyondLastLine" = false;
	"editor.stickyScroll.enabled" = false;
	"git.confirmSync" =  false;
	"git.enableSmartCommit" = true;
	"security.workspace.trust.enabled" = false;
	"workbench.tree.enableStickyScroll" = false;
};

extensions = with pkgs.vscode-extensions; [
	bbenoist.nix
	tamasfe.even-better-toml
];

in

{
	programs.vscode = {
		inherit extensions keybindings userSettings;
		enable = true;
		enableUpdateCheck = false;
	};

}
