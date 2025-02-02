{ pkgs, config, ... }:
{
  programs.neovim = {
    enable = true;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    plugins = [ pkgs.vimPlugins.lazy-nvim ];
  };

  xdg.configFile.nvim = {
    source = ./nvim;
  };
}
