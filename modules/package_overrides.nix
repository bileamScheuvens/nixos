{ inputs, pkgs, ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      ferium = final.callPackage ../packages/ferium { };
      crawl = final.callPackage ../packages/crawl { };
      discord = (final.callPackage ../packages/discord { }).discord;
      fastmail-desktop = final.callPackage ../packages/fastmail-desktop { };
      # vim-hypr-nav = final.callPackage ../packages/vim-hypr-nav { };
      waybar = prev.waybar.overrideAttrs (old: {
        src = pkgs.fetchFromGitHub {
          owner = "alexays";
          repo = "waybar";
          rev = "16843896794a9c595139318420f81f40e84f8c78";
          hash = "sha256-Y/bf7OmtwrEhdRDTkh4OVAEZX5ixL+io0W/UPJuto+g=";
        };
        nativeBuildInputs = old.nativeBuildInputs ++ [ prev.cmake ];
        buildInputs = old.buildInputs ++ [
          prev.modemmanager
        ];
        mesonFlags = old.mesonFlags ++ [ "-Dcava=disabled" ];

      });
    })
    inputs.affinity-nix.overlays.default
  ];
}
