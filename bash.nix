{ config, pkgs, ...}:

{
  environment.interactiveShellInit = ''
    eval "$(zoxide init bash)"
    function poetry-install-fix() {
      poetry install && fix-python --venv $(poetry env info -p)
    }
  '';
}
