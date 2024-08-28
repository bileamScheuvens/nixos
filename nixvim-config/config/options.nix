{ lib, pkgs, ... }:

{
  config.opts = {
    # style
    number = true;
    relativenumber = true;

    # indentation
    shiftwidth = 2;
    tabstop = 2;
    expandtab = true;
    autoindent = true;
    smartindent = true;

    # search
    ignorecase = true;
    smartcase = true;
    incsearch = true;
    wrapscan = true;

    # external footprint
    clipboard = "unnamedplus";
    swapfile = false;
    undofile = true;
    undodir="~/.vim/undodir";
  };
}
