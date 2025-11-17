{ config, pkgs, ...}:

{
  environment.interactiveShellInit = ''
    eval "$(zoxide init bash)"

    alias icat="kitten icat"
    alias ..="cd .."
    alias ...="cd ../.."

    function poetry-install-fix() {
      poetry install --no-root && fix-python --venv $(poetry env info -p)
    }
    function poetry-install-fix-full() {
      poetry install --no-root && fix-python --venv $(poetry env info -p) --libs /etc/nixos/modules/libs.nix
    }

    # ignore certain endings for nvim
    complete -f -X "*.@(bib|pdf|png|jpg)" nvim

    # ctrl+backspace to delete word
    bind '"\C-H": backward-kill-word'
  '';
}
