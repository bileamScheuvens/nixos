{ config, pkgs, ...}:

{
  environment.interactiveShellInit = ''
    eval "$(zoxide init bash)"
  '';
}
