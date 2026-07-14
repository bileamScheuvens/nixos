{ pkgs, ... }:
{
  home.stateVersion = "25.11"; # Did you read the comment?
  imports = [
    # ../modules/niri.nix
    ../modules/sioyek.nix
  ];

  xdg = {
    configFile = {
      "xdg-desktop-portal-termfilechooser/config" = {
        force = true;
        executable = true;
        text = ''
          [filechooser]
          cmd=${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh
          default_dir=$HOME
          create_help_file=1
          env=TERMCMD='kitty --title filechooser'
          env=PATH="$PATH:/run/current-system/sw/bin"
          open_mode=suggested
          save_mode=last
        '';
      };
    };
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-wlr
        # xdg-desktop-portal-gtk
        xdg-desktop-portal-termfilechooser
      ];

      config.common = {
        "org.freedesktop.impl.portal.FileChooser" = [ "termfilechooser" ];
      };
    };

  };
}
