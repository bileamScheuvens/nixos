{ pkgs, inputs, ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
  programs.waybar.enable = true;
  environment.sessionVariables = {
    NIXOS_OZONE_WL = 1;
  };

  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "tuigreet --time --remember --cmd 'uwsm start hyprland-uwsm.desktop'";
      user = "bileam";
    };
  };

}
