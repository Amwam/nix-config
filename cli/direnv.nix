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
  };

  programs.zsh.initExtra = ''
    eval "$(direnv hook zsh)"
  '';

}
