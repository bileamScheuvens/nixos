{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;

    settings = {
      yazi.opener = {
        typst-compile = [
          {
            run = "typst compile %s";
            block = true;
            desc = "typst-compile";

          }
        ];
        edit = [
          {
            run = "$EDITOR %s";
            block = true;
            desc = "edit";

          }
        ];
        xdg_open = [
          {
            run = "xdg-open \"$@\"";
            orphan = true;
            desc = "xdg open";
          }
        ];
      };
      yazi.open = {
        prepend_rules = [
          {
            url = "*.typ";
            use = [
              "edit"
              "typst-compile"
            ];
          }
          {
            url = "*.html";
            use = [
              "xdg_open"
              "edit"
            ];
          }
        ];
      };
      keymap.mgr.prepend_keymap = [
        {
          on = [
            "g"
            "o"
          ];
          run = "arrow top";
          desc = "go to top";
        }
        {
          on = [ "H" ];
          run = "hidden toggle";
          desc = "toggle hidden";
        }
        {
          on = [ "d" ];
          run = "remove --force";
          desc = "force delete";

        }
        {
          on = "u";
          run = "plugin restore";
          desc = "restore trash";

        }
      ];

    };
    plugins = {
      restore = pkgs.yaziPlugins.restore;
    };
  };
}
