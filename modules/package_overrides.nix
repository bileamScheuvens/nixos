{ inputs, pkgs, ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      ferium = final.callPackage ../packages/ferium { };
      crawl = final.callPackage ../packages/crawl { };
      fastmail-desktop = final.callPackage ../packages/fastmail-desktop { };
      # vim-hypr-nav = final.callPackage ../packages/vim-hypr-nav { };
    })
    inputs.affinity-nix.overlays.default
  ];
}
