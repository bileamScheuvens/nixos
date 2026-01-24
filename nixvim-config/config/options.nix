{ lib, pkgs, ... }:

{
  config.opts = {
    # style
    number = true;
    relativenumber = true;
    signcolumn = "auto";
    scrolloff = 4;
    conceallevel = 1;
    showtabline = 0;

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
    undodir.__raw = "vim.fs.normalize('~/.vim/undodir')";

    # misc
    timeoutlen = 300;
    termguicolors = true;
  };
}
