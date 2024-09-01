{ lib, pkgs, ... }:

{
  config.opts = {
    # style
    number = true;
    relativenumber = true;
    signcolumn = "yes";
    scrolloff = 4;

    # indentation
    shiftwidth = 2;
    tabstop = 2;
    expandtab = true;
    autoindent = true;
    smartindent = true;
    breakindent = true;

    # search
    hlsearch = true;
    ignorecase = true;
    smartcase = true;
    incsearch = true;
    wrapscan = true;
    inccommand = "split";

    # external footprint
    clipboard.providers.xsel.enable = true;
    clipboard.register = "unnamedplus";
    swapfile = false;
    undofile = true;

    # misc
    timeoutlen = 200;
  };
}
