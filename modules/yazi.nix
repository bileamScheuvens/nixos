{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;

    settings = {
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
          on = ["H"];
          run = "hidden toggle";
          desc = "toggle hidden";

        }
        {
          on = ["d"];
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
