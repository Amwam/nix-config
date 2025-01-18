{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    iterm2
  ];

  # programs.iterm2 = {
  #   enable = true;
  # };
}
