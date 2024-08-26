{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (pkgs.vim_configurable.customize {
      name = "vim";
      vimrcConfig.customRC = ''
        set nocompatible
        syntax enable
        " doublepress timeout
        set timeoutlen=200
            
        " line numbering, tabwidth
        set relativenumber number
        set tabstop=4 shiftwidth=4 expandtab
    
        " search options and fzf map
        set ignorecase smartcase wrapscan
        set hlsearch
        nnoremap <esc><esc> :noh<return><esc>
        :nnoremap <F2>      :set cursorcolumn! cursorline!<CR>
        :inoremap <F2> <C-o>:set cursorcolumn! cursorline!<CR>

        " share clipboard
        set clipboard=unnamed
        
        " persist undohistory
        set undodir=~/.vim/undodir undofile
      '';
      vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
        start = [ vim-addon-nix vim-peekaboo fzf-vim vim-gutentags];
        opt = [];
      };
    })
  ];
}

