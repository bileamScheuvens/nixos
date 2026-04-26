{ ... }:
{
  nixpkgs.overlays = [
    (new: old: {
      crawl = new.callPackage ../packages/crawl { };
      vim-hypr-nav = new.callPackage ../packages/vim-hypr-nav { };
    })
  ];
}
