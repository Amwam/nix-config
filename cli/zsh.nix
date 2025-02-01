{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zsh
    starship
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    sessionVariables = {
      SSH_AUTH_SOCK = "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
      EDITOR = "vim";
    };

    syntaxHighlighting.enable = true;
    initExtra = ''
      eval "$(${pkgs.starship}/bin/starship init zsh)"
    '';

  };

  home.file = {
    ".config/startship.toml" = {
      text = builtins.readFile ./zsh/starship.toml;

    };
  };

  # home.file = [
  #   {
  #     name = ".config/starship.toml";
  #     file = ./cli/zsh/starship.toml;
  #   }
  # ];

  # xdg.configFile.starship = ./cli/zsh/starship.toml;
}
