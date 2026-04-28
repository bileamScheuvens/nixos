{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:
let
  src = fetchFromGitHub {
    owner = "bileamScheuvens";
    repo = "vim-hypr-nav";
    rev = "278451847496514bdf11e2bf28998697f070236a";
    hash = "sha256-czZbgvd0OWtDevRN7l0GDlEDjXQ43FcCqjvlmCRTCkU=";
  };
in
rustPlatform.buildRustPackage {
  pname = "vim-hypr-nav";
  version = "0.1.0";
  inherit src;

  cargoLock.lockFile = "${src}/Cargo.lock";

  meta = {
    description = "Seamless navigation between hyprland windows and (Neo)Vim splits with the same key bindings. Slop Rust rewrite.";
    homepage = "https://github.com/bileamScheuvens/vim-hypr-nav";
    platforms = lib.platforms.linux;
    license = lib.licenses.gpl3;
    maintainers = [ ];
  };
}
