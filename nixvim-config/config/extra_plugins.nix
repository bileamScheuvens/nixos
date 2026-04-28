{ pkgs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "vim-hypr-nav";
      version = "0.0.1";
      src = pkgs.fetchFromGitHub {
        owner = "bileamScheuvens";
        repo = "vim-hypr-nav";
        rev = "278451847496514bdf11e2bf28998697f070236a";
        hash = "sha256-czZbgvd0OWtDevRN7l0GDlEDjXQ43FcCqjvlmCRTCkU=";
      };
    })
  ];
}
