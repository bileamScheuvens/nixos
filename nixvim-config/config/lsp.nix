{
  plugins = {
    nix.enable = true;
    fidget.enable = true;
    lsp = {
      enable = true;

      keymaps = {
        silent = true;
        diagnostic = {
          # Navigate in diagnostics
          "<leader>k" = "goto_prev";
          "<leader>j" = "goto_next";
        };

        lspBuf = {
            gd = "definition";
            gD = "references";
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            "<F2>" = "rename";
          };
      };

      servers = {
        lua_ls.enable = true;
        ruff.enable = true;
        # julials.enable = true;
        texlab.enable = true;
      };
    };

  treesitter = {
    enable = true;

    settings = {
      highlight.enable = true;
      hightlight.additional_vim_regex_highlighting = true;
      ensure_installed = [
        "python"
        "comment"
        "json"
        "latex"
        "markdown"
        "regex"
        "yaml"
        "html"
        "toml"
        "nix"
        "julia"
      ];
    };
    folding = true;

    };
  };
}
