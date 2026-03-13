{
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  keymaps = [
    # open terminal
    {
      mode = "n";
      key = "<leader>t";
      action = "<cmd>term<CR>";
    }
    # trigger formatting
    {
      mode = "n";
      key = "<leader>f";
      action = "<cmd>lua vim.lsp.buf.format()<CR>";
    }
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
    # system copy & paste with leader
    {
      mode = "v";
      key = "<leader>y";
      action = "\"+y";
    }
    {
      mode = "v";
      key = "<leader>p";
      action = "\"+p";
    }
    {
      mode = "n";
      key = "<leader>y";
      action = "\"+y";
    }
    {
      mode = "n";
      key = "<leader>Y";
      action = "\"+Y";
    }
    {
      mode = "n";
      key = "<leader>p";
      action = "\"+p";
    }
    {
      mode = "n";
      key = "<leader>P";
      action = "\"+P";
    }
    # copy current file path to system clipboard
    {
      mode = "n";
      key = "yp";
      action = "<cmd>let @+ = expand(\"%:p\")<CR>";
    }
    # toggle type hints
    {
      mode = "n";
      key = "<leader>h";
      action.__raw = ''
        function() 
           vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) 
        end '';
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
