{ config, pkgs, ... }:

let
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-medium
    bbm
  });
in
{
  inherit tex;
}
