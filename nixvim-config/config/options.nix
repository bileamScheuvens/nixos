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
    clipboard.register = "unnamedplus";
    clipboard.providers.wl-copy.enable = true;
    swapfile = false;
    undofile = true;
    # still doesnt seem to work
    # undodir = builtins.getEnv "HOME" + ".vim/undodir";

    # misc
    timeoutlen = 250;
    termguicolors = true;
  };
}
