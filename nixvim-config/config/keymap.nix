{
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };
  
  keymaps = [
  
  # clear searchhighlight 
  {
    mode = "n";
    key = "<Esc>";
    action = "<cmd>nohlsearch<CR>";
  }
  # exit terminal mode
  {
    mode = "t";
    key = "<Esc><Esc>";
    action = "<C-\\><C-n>";
    options = {
      nowait = true;
    };
  }
  # make
  {
    mode = "n";
    key = "<leader>mk";
    action = "<cmd>make<CR>";
  }
  # quickfix navigation
   {
    mode = "n";
    key = "<M-j>";
    action = "<cmd>cnext<CR>";
  } 
  {
    mode = "n";
    key = "<M-k>";
    action = "<cmd>cprev<CR>";
  }
  # obsidian new note and insert template
  # {
  #   mode = "n";
  #   key = "<leader>on";
  #   action = "<cmd>Obsidian new<CR>";
  # }
  # {
  #   mode = "n";
  #   key = "<leader>oN";
  #   action = "<cmd>Obsidian new_from_template<CR>";
  # }
  # {
  #   mode = "n";
  #   key = "<leader>ot";
  #   action = "<cmd>Obsidian template<CR>";
  # }
  ];
}
