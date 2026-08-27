{ inputs, ... }:
{
  nixpkgs.overlays = [
    (new: old: {
      ferium = new.callPackage ../packages/ferium { };
      crawl = new.callPackage ../packages/crawl { };
      discord = (new.callPackage ../packages/discord { }).discord;
      fastmail-desktop = new.callPackage ../packages/fastmail-desktop { };
      vim-hypr-nav = new.callPackage ../packages/vim-hypr-nav { };
    })
    inputs.affinity-nix.overlays.default
  ];
}
