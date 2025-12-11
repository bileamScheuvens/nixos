{ config, pkgs, ...}:

{
  environment.interactiveShellInit = ''
    eval "$(direnv hook bash)"
    eval "$(starship init bash)"
    eval "$(zoxide init bash)"

    alias icat="kitten icat"
    alias vi="nvim"
    alias brightness="ddcutil setvcp 10"
    alias ..="cd .."
    alias ...="cd ../.."


    alias direnv_init="echo 'use flake' >> .envrc && direnv allow"

    function poetry-install-fix() {
      poetry install --no-root && fix-python --venv $(poetry env info -p)
    }

    # ignore certain endings for nvim
    complete -f -X "*.@(lock|bib|pdf|png|jpg)" nvim

    # ctrl+backspace to delete word
    bind '"\C-H": backward-kill-word'
  '';
}
