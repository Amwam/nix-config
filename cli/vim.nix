{ ... }:
{
  programs.neovim = {
    enable = true;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    extraConfig = ''
      filetype plugin indent on
      set noswapfile
      set nobackup

      set clipboard=unnamed

      " Enables :Paste to just do what you want
      command Paste execute 'set noai | insert | set ai'

      set number
      syntax on
      set hidden
      set title
      set autoindent
      set copyindent

      " Write on focus lost
      au FocusLost * silent! :wa

      set expandtab " Insert spaces instead of tabs

      " Search improvements
      set incsearch " Highlight as you search
      set ignorecase " Ignore case when seaching
      set smartcase " Ignores case, except when capitals are used

      set cursorline " Highlight current line

      set mouse=a

      "folke/snacks.nvim",
    '';

  };

}
