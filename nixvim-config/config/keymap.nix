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
  # obsidian new note and insert template
  {
    mode = "n";
    key = "<leader>on";
    action = "<cmd>ObsidianNew<CR>";
  }
  {
    mode = "n";
    key = "<leader>ot";
    action = "<cmd>ObsidianTemplate<CR>";
  }
  ];
}
