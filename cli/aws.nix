{ pkgs, ... }:
{
  home.packages = with pkgs; [ awscli2 ];

  home.file = {
    ".aws".source = ./aws;
  };
}
