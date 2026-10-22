{
  # plugins.conjure.enable = true;
  plugins.obsidian = {
    enable = true;
    settings = {
      legacy_commands = false;
      picker.name = "telescope.nvim";
      templates = {
        subdir = "/home/bileam/vaults/templates";
        substitutions = {
          zkID = ''
            function()
              id = ""
              for _ = 1, 4 do
                id = id .. string.char(math.random(65, 90))
              end
              return id
            end
          '';
        };
      };
      workspaces = [
        {
          name = "phd";
          path = "/home/bileam/vaults/phd";
        }
      ];
    };
  };
}
