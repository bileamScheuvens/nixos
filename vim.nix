{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (pkgs.vim_configurable.customize {
      name = "vim";
      vimrcConfig.customRC = ''
        syntax enable
        set relativenumber number
        set nocompatible
        set tabstop=4
        set shiftwidth=4
        set expandtab

        set hlsearch
        nnoremap <esc><esc> :noh<return><esc>
      '';
      vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
        start = [ vim-addon-nix ];
        opt = [];
      };
    })
  ];
}

