{ inputs, pkgs, ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      ferium = final.callPackage ../packages/ferium { };
      crawl = final.callPackage ../packages/crawl { };
      fastmail-desktop = final.callPackage ../packages/fastmail-desktop { };
      # vim-hypr-nav = final.callPackage ../packages/vim-hypr-nav { };
      waybar = prev.waybar.overrideAttrs (old: {
        src = pkgs.fetchFromGitHub {
          owner = "alexays";
          repo = "waybar";
          rev = "c15ec02ede4343592a59eb5c2ff4443c9c045f7c";
          hash = "sha256-mBDWjeeIuFfDZQuBxHu+EpbJ+GMbbSxpRz0WVM2N+ZI=";
        };
      });
    })

    inputs.affinity-nix.overlays.default
  ];
}
