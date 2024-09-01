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
  }
  ];
}
