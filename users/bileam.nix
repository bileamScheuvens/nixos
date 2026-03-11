{ ... }:
{
  home.stateVersion = "25.11"; # Did you read the comment?
  imports = [ 
    # ../modules/niri.nix
    ../modules/sioyek.nix
  ];
}

