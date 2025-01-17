{
  pkgs,
  environment,
  home-manager,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    vscode
    #vscode-marketplace
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
      "nix.serverSettings.nil.formatting.command" = [ "nixfmt" ];

    };

    #extensions = with pkgs; [
    # vscode-marketplace.jnoortheen.nix-ide
    # vscode-marketplace.vscodevim.vim
    #];
  };
}
