{ pkgs, ... }:
{
  fonts = {
    fontconfig.enable = true;
    packages = [ pkgs.font-awesome ];
  };
}
