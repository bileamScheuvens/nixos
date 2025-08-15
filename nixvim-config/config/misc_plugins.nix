{
  plugins.conjure.enable = true;
  plugins.obsidian = {
    enable = true;
    settings = {
      opts.legacy_commands = false;
      picker.name = "telescope.nvim";
      templates =  {
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
          name = "personal";
          path = "/home/bileam/vaults/personal";
        }
        {
          name = "uni";
          path = "/home/bileam/vaults/uni";
        }
      ];
      note_id_func = ''
        function(title)
          local id = "unnamed"
          
          if title ~= nil then
            -- If title is given, transform it into a valid file name
            id = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", "")
          end
          id = id .. "-"
          
          -- Add 4 random uppercase letters to the id
          for _ = 1, 4 do
            id = id .. string.char(math.random(65, 90))
          end
          
          return id
        end
      '';
    };
  };
}
