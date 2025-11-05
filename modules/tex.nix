{ config, pkgs, ... }:

let
  tex = (pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-basic;
  });
in
{
  inherit tex;
}
