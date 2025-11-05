{ config, pkgs, ...}:

{
  environment.interactiveShellInit = ''
    eval "$(zoxide init bash)"

    alias icat="kitten icat"
    alias ..="cd .."
    alias ...="cd ../.."

    function poetry-install-fix() {
      poetry install --no-root && fix-python --venv $(poetry env info -p) --libs /etc/nixos/libs.nix
    }

    complete -f -X "*.@(bib|pdf|png|jpg)" nvim

  '';
}
