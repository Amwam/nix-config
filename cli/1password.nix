{ inputs, pkgs, ... }: {
  imports = [ inputs._1password-shell-plugins.hmModules.default ];

  home.packages = with pkgs; [ _1password-cli awscli2 ];

  programs._1password-shell-plugins = {
    # enable 1Password shell plugins for bash, zsh, and fish shell
    enable = true;
    # the specified packages as well as 1Password CLI will be
    # automatically installed and configured to use shell plugins
    plugins = with pkgs; [ awscli2 ];
  };
}
