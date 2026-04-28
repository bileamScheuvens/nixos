{ fetchFromGitHub }:
{
  nixpkgs.overlays = [
    (final: prev: {
      vim-hypr-nav = final.vimUtils.buildVimPlugin {
        name = "vim-hypr-nav";
        src = fetchFromGitHub {
          owner = "bileamScheuvens";
          repo = "vim-hypr-nav";
          rev = "c39eb43f3e04452597e8795245356df8ad0b50d4";
          hash = "sha256-unktB2aeAQTdPbNRIvRP9BQo4uwDPPzY4Sg14cyyduU=";
        };
      };
    })

  ];
}
