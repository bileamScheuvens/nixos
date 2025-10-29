{
  ###### COLORSCHEME ###### 
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
      custom_highlights = {
        LineNr = { fg = "#888888"; };
        CursorLineNr = { fg = "#ffffff"; bold = true; };
      };
    };
   };
  

  ###### UI COMPONENTS ###### 
  plugins.bufferline.enable = true;
  plugins.markdown-preview.enable = true;
  plugins.typst-preview.enable = true;
  # Neo-tree is a Neovim plugin to browse the file system
  # https://nix-community.github.io/nixvim/plugins/neo-tree/index.html?highlight=neo-tree#pluginsneo-treepackage
  plugins.neo-tree = {
    enable = true;
    settings = {
      window.position = "right";
    };
  };

  # https://nix-community.github.io/nixvim/keymaps/index.html
  keymaps = [
    {
      key = "\\";
      action = "<cmd>Neotree toggle<cr>";
      options = {
        desc = "NeoTree toggle";
      };
    }
  ];
  plugins.web-devicons.enable = true;
}
