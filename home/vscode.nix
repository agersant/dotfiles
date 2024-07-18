{ ... }:

let

keybindings = [
	{
		key: "ctrl+d",
		command: "editor.action.copyLinesDownAction",
		when: "editorTextFocus"
	}
	{
		key: "shift+ctrl+d",
		command: "editor.action.deleteLines",
		when: "editorTextFocus"
	}
	{
		key: "shift+ctrl+up",
		command: "editor.action.moveLinesUpAction",
		when: "editorTextFocus"
	}
	{
		key: "shift+ctrl+down",
		command: "editor.action.moveLinesDownAction",
		when: "editorTextFocus"
	}
	{
		key: "ctrl+q",
		command: "editor.action.commentLine",
		when: "editorTextFocus"
	}
	{
		key: "ctrl+shift+u",
		command: "editor.action.transformToUppercase"
		when: "editorTextFocus"
	}
	{
		key: "ctrl+u",
		command: "editor.action.transformToLowercase"
		when: "editorTextFocus"
	}
	{
		key: "f4",
		command: "editor.action.revealDefinition",
		when: "editorHasDefinitionProvider && editorTextFocus && !isInEmbeddedEditor"
	}
	{
		key: "shift+f4",
		command: "workbench.action.navigateBack",
		when: "editorTextFocus"
	}
];

userSettings = {
	"security.workspace.trust.enabled" = false;
	"git.enableSmartCommit" = true;
};

in

{
	programs.vscode = {
		enable = true;
		keybindings = keybindings;
		userSettings = userSettings;
	};
}
