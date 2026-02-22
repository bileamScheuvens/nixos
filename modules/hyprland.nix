{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
  };
  programs.waybar.enable = true;
  environment.sessionVariables = {
    NIXOS_OZONE_WL = 1;
  };

  fonts = {
    fontconfig.enable = true;
    packages = [
      pkgs.font-awesome
    ];
  };
}
