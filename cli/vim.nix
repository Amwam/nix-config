{...}:
{
  programs.vim = {
    enable = true;



  defaultEditor = true;
    extraConfig = ''
      filetype plugin indent on
      set noswapfile
      set nobackup

      set clipboard=unnamed

      set number
      sytax on
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
    '';
  };
}
