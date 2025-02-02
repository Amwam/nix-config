{ pkgs, ... }: {
  home.packages = [ pkgs.nil pkgs.nixfmt pkgs.ripgrep pkgs.cargo ];

  programs.neovim = {
    enable = true;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    plugins = [ pkgs.vimPlugins.lazy-nvim ];
  };

  xdg.configFile.nvim = { source = ./nvim; };
}
