{
  pkgs,
  inputs,
  ...
}:
{

  programs.direnv = {
    enable = true;
    package = pkgs.direnv;
    nix-direnv.enable = true;
    enableZshIntegration = true;

    config = {
      hide_env_diff = true;
    };

  };
}
