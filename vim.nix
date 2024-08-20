{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (pkgs.vim_configurable.customize {
      name = "vim";
      vimrcConfig.customRC = ''
        set nocompatible
        syntax enable
        set relativenumber number
        set ignorecase smartcase wrapscan

        set tabstop=4 shiftwidth=4 expandtab

        set hlsearch

        set timeoutlen=200
        nnoremap <esc><esc> :noh<return><esc>

        set clipboard=unnamed
        
        set undodir=~/.vim/undodir undofile
      '';
      vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
        start = [ vim-addon-nix vim-peekaboo fzf-vim];
        opt = [];
      };
    })
  ];
}

