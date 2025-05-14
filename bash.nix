{ config, pkgs, ...}:

{
  environment.interactiveShellInit = ''
    eval "$(zoxide init bash)"
    function poetry-install-fix() {
      poetry install --no-root && fix-python --venv $(poetry env info -p) --libs /etc/nixos/libs.nix
    }
  '';
}
