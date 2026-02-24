{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    qutebrowser
    rbw # unofficial bitwarden cli
    pinentry-tty
  ];

  xdg.mime.defaultApplications = {
    "text/html" = "org.qutebrowser.qutebrowser.desktop";
    "application/pdf" = "org.qutebrowser.qutebrowser.desktop";
    "x-scheme-handler/http" = "org.qutebrowser.qutebrowser.desktop";
    "x-scheme-handler/https" = "org.qutebrowser.qutebrowser.desktop";
    "x-scheme-handler/about" = "org.qutebrowser.qutebrowser.desktop";
    "x-scheme-handler/unknown" = "org.qutebrowser.qutebrowser.desktop";
  };

}
