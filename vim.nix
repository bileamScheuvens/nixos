{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (pkgs.vim_configurable.customize {
      name = "vim";
      vimrcConfig.customRC = ''
        set nocompatible
        syntax enable
        set relativenumber number

        set tabstop=4 shiftwidth=4 expandtab

        set hlsearch
        nnoremap <esc><esc> :noh<return><esc>

        set clipboard=unnamed
      '';
      vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
        start = [ vim-addon-nix vim-peekaboo ];
        opt = [];
      };
    })
  ];
}

