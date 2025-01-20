{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    vscode
    nixfmt-rfc-style
    nil
  ];

  home-manager.users.amit.programs.vscode = {
    enable = true;
    userSettings = {
      # This property will be used to generate settings.json:
      # https://code.visualstudio.com/docs/getstarted/settings#_settingsjson
      "editor.formatOnSave" = true;
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "nix.serverSettings.nil.formatting.command" = [ "nixfmt" ];
      "git.autofetch" = true;
    };

    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      jnoortheen.nix-ide
    ];
  };
}
