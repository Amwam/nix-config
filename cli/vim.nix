{ pkgs, ... }: {
  home.packages = with pkgs; [ nil nixfmt-rfc-style ripgrep cargo ];

  programs.neovim = {
    enable = true;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    plugins = [ pkgs.vimPlugins.lazy-nvim ];
  };

  xdg.configFile.nvim = { source = ./nvim; };
}
