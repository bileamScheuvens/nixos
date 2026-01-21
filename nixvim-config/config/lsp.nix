{
  plugins = {
    nix.enable = true;
    fidget.enable = true;
    lsp = {
      enable = true;
      inlayHints = true;

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
            H = "hover";
            "<F2>" = "rename";
          };
      };

      servers = {
        lua_ls.enable = true;
        ruff.enable = true;
        pylsp = {
          enable = true;
          settings.plugins = {
          };
        };
        # julials.enable = true;
        tinymist = {
          enable = true;
          settings.formatterMode = "typstyle";

        };
        texlab.enable = true;
        clangd.enable = true;
        nixd.enable = true;
      };
    };
    # sane defaults
    lsp-format.enable = true;

  treesitter = {
    enable = true;

    settings = {
      highlight = {
        enable = true;
        additional_vim_regex_highlighting = true;
        disable = [
          "latex"
        ];
      };
      auto_install = false;
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
        "bibtex"
        "vim"
        "c"
      ];
    };

    };
  };
}

