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
	"editor.fontLigatures" = true;
	"editor.fontWeight" = 700;
	"editor.formatOnSave" = true;
	"editor.inlayHints.enabled" = "offUnlessPressed";
	"editor.lineHeight" = 1.6;
	"editor.minimap.enabled" = false;
	"editor.scrollBeyondLastLine" = false;
	"editor.stickyScroll.enabled" = false;
	"explorer.confirmDelete" = false;
	"explorer.confirmDragAndDrop" = false;
	"git.confirmSync" =  false;
	"git.enableSmartCommit" = true;
	"security.workspace.trust.enabled" = false;
	"workbench.colorTheme" = "Ayu Mirage Bordered";
	"workbench.iconTheme" = "ayu";
	"workbench.tree.enableStickyScroll" = false;
};

extensions = with pkgs.vscode-extensions; [
	teabyii.ayu
	mkhl.direnv
	bbenoist.nix
	tamasfe.even-better-toml
	rust-lang.rust-analyzer
	vue.volar
];

in

{
	stylix.targets.vscode.enable = false;

	programs.vscode = {
		inherit extensions keybindings userSettings;
		enable = true;
		enableUpdateCheck = false;
	};

}
