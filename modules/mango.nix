{ ... }:
{
  programs.uwsm.enable = true;
  programs.mango.enable = true;
  programs.waybar.enable = true;
  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "tuigreet --time --remember --cmd 'uwsm start mango'";
      user = "bileam";
    };
  };
}
