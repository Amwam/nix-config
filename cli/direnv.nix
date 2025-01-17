{
  inputs,
  username,
  pkgs,
  environment,
  ...
}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  environment.systemPackages = [
    pkgs.direnv
  ];

  home-manager.users.${username}.programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
