{ pkgs, ... }:
{
  home.stateVersion = "25.11"; # Did you read the comment?
  # i hate this
  # why do i need 2 module selections just because its a home manager module
  imports = [ ../modules/niri.nix];
}

