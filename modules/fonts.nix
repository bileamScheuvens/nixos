{ pkgs, ... }:
{
  fonts = {
    fontconfig.enable = true;
    packages = with pkgs; [
      font-awesome
      nerd-fonts.jetbrains-mono
      fira-code
      fira-code-symbols
      libertinus
    ];
  };
}
