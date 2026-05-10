{ pkgs, ... }:
{
  fonts = {
    fontconfig.enable = true;
    packages = with pkgs; [
      font-awesome
      libertinus
    ];
  };
}
