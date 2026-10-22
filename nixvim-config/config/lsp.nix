{ lib, ... }:
{
  lsp = {
    inlayHints = {
      # managed by nixvim but toggled
      enable = true;
      activate = false;
    };

    keymaps =
      # frame stolen from @GaetanLepage
      lib.mapAttrsToList
        (
          key: props:
          {
            inherit key;
            options.silent = true;
          }
          // props
        )
        {
          "<leader>k".action.__raw = "function() vim.diagnostic.jump({ count=-1, float=true }) end";
          "<leader>j".action.__raw = "function() vim.diagnostic.jump({ count=1, float=true }) end";
          gd.lspBufAction = "definition";
          gD.lspBufAction = "references";
          gt.lspBufAction = "type_definition";
          gi.lspBufAction = "implementation";
          H.lspBufAction = "hover";
          "<F2>".lspBufAction = "rename";
          "<leader>f".lspBufAction = "format";
        };
    servers = {
      nixd.enable = true;
      jdtls.enable = true;
      lua_ls.enable = true;
      julia_ls.enable = true;
      ruff.enable = true;
      rust.enable = true;
      ty.enable = true;
      tinymist = {
        enable = true;
        config.settings = {
          formatterMode = "typstyle";
          projectResolution = "lockDatabase";
          exportPdf = "onSave";
        };
      };
      texlab.enable = true;
      clangd.enable = true;
      yamlls.enable = true;
    };
  };
  plugins = {
    # formatting
    lsp-format.enable = true;
    # sane defaults
    lspconfig.enable = true;

    treesitter = {
      enable = true;
      highlight.disable = true;

      settings = {
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
