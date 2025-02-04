{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zsh
    starship
    nerd-fonts.fira-code
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


      # Case insensitive cd
      autoload -Uz compinit && compinit
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
    '';

  };

  home.file = {
    ".config/startship.toml" = {
      text = builtins.readFile ./zsh/starship.toml;

    };
  };
}
