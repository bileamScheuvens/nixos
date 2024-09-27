{
  plugins.obsidian = {
    enable = true;
    settings = {
      picker.name = "telescope.nvim";
      workspaces = [
        {
          name = "personal";
          path = "~/vaults/vault";
        }
        {
          name = "uni";
          path = "~/vaults/uni";
        }
      ];
    };
  };
}
