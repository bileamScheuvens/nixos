{
  plugins = {
    nvim-autopairs = {
      enable = true;
      settings = {
        disable_filetype = [
          "TelescopePrompt"
          "vim"
        ];
      };
    };
    luasnip = {
      enable = true;
      fromLua = [
        {
          lazyLoad = true;
          paths = ./snippets;
        }
      ];
    };

    lspkind = {
      enable = true;

      settings.cmp = {
        enable = true;
        menu = {
          nvim_lsp = "[LSP]";
          nvim_lua = "[api]";
          path = "[path]";
          luasnip = "[snip]";
          buffer = "[buffer]";
        };
      };
    };

    # use blink
    cmp.enable = false;

    blink-cmp-git.enable = true;
    blink-cmp = {
      enable = true;
      settings = {
        sources = {
          default = [
            "lsp"
            "snippets"
            "buffer"
            "path"
            # auth broken, wait for new release
            # "git"
          ];
          providers = {
            git = {
              module = "blink-cmp-git";
              name = "git";
            };
          };
        };
        completion = {
          list.selection.preselect = false;
          documentation = {
            auto_show = true;
            auto_show_delay_ms = 500;
          };
        };
        signature.enabled = true;
        term.enabled = true;
        keymap = {
          "<C-h>" = [
            "show"
            "show_documentation"
            "hide_documentation"
            "fallback"
          ];
          "<Tab>" = [
            "select_next"
            "snippet_forward"
            "fallback"
          ];
          "<S-Tab>" = [
            "select_prev"
            "snippet_backward"
            "fallback"
          ];
        };
      };
    };

  };
}
