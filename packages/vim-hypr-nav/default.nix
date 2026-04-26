{
  lib,
  fetchFromGitHub,
  rustPlatform,
}:
let
  src = fetchFromGitHub {
    owner = "bileamScheuvens";
    repo = "vim-hypr-nav";
    rev = "bbe97f1f29b45ca0f1eaab6e210115516e3f5f68";
    hash = "sha256-nX/CzXUjNMEdk2cw7ryGmv2DXkg9Ge8j/Fscsg3UmAA=";
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
