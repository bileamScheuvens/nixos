{
  ###### COLORSCHEME ###### 
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
    };
   };
  

  ###### UI COMPONENTS ###### 
  plugins.bufferline.enable = true;
  plugins.markdown-preview.enable = true;
  # Neo-tree is a Neovim plugin to browse the file system
  # https://nix-community.github.io/nixvim/plugins/neo-tree/index.html?highlight=neo-tree#pluginsneo-treepackage
  plugins.neo-tree = {
    enable = true;

    filesystem = {
      window = {
        mappings = {
          "\\" = "close_window";
        };
      };
    };
  };

  # https://nix-community.github.io/nixvim/keymaps/index.html
  keymaps = [
    {
      key = "\\";
      action = "<cmd>Neotree reveal<cr>";
      options = {
        desc = "NeoTree reveal";
      };
    }
  ];
}
