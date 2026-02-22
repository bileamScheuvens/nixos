{ pkgs, ...}:

{
  environment.interactiveShellInit = ''
    eval "$(direnv hook bash)"
    eval "$(starship init bash)"
    eval "$(zoxide init bash)"

    export PATH=~/scripts/:$PATH

    alias icat="kitten icat"
    alias vi="nvim"
    alias pvi="poetry run nvim"
    alias brightness="ddcutil setvcp 10"
    alias ..="cd .."
    alias ...="cd ../.."

    alias screenshot="grim - | wl-copy && wl-paste > ~/Pictures/screenshots/screenshot-\$(date +%F_%T).png && dunstify 'Screenshot of whole screen taken' -t 1000"

    alias screenshot_region="grim -g \"\$(slurp)\" - | wl-copy && wl-paste > ~/Pictures/screenshots/screenshot-\$(date +%F_%T).png && dunstify 'Screenshot of the region taken' -t 1000"

    alias direnv_init="echo 'use flake' >> .envrc && direnv allow"

    function poetry-install-fix() {
      poetry install --no-root && fix-python --venv $(poetry env info -p)
    }


    # ignore certain endings for nvim
    complete -f -X "*.@(lock|bib|pdf|png|jpg)" nvim
    complete -f -X "*.@(lock|bib|pdf|png|jpg)" vi

    # ctrl+backspace to delete word
    bind '"\C-H": backward-kill-word'

    # ctrl+o to edit command in nvim
    bind '"\C-o": edit-and-execute-command'
  '';

  environment.variables = {
    KITTY_SCROLLBACK_NVIM = "${pkgs.vimPlugins.kitty-scrollback-nvim}";
    KITTY_SCROLLBACK_VISUAL = "${pkgs.vimPlugins.kitty-scrollback-nvim}/scripts/edit_command_line.bash";
  };
}
