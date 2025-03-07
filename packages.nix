{ config, pkgs, inputs, ... }:

let 
  texPackages = import ./tex.nix { inherit config pkgs; };
in
{
  environment.systemPackages = with pkgs; [
  # version control
  git
  git-lfs

  # social
  discord
  teams-for-linux
  signal-desktop

  # productivity
  obsidian
  mako
  anki-bin
  
  # utilities
  htop
  wget
  curl
  unzip
  zip
  grim
  slurp
  powertop
  busybox
  fzf
  tldr
  bat
  eza
  zoxide
  ripgrep
  wl-clipboard
  cliphist
  libsecret

  # framework specific
  linuxKernel.packages.linux_xanmod_latest.framework-laptop-kmod
  
  # text editing
  vscode
  vim
  inputs.nixvim.packages."${system}".default
  texPackages.tex
  

  # development
  julia
  python312
  poetry
  python312Packages.pudb
  gcc
  libgcc
  gnumake
  cmake
  extra-cmake-modules
  universal-ctags
  libz
  stdenv.cc.cc.lib
  swig

  # deps for PyQt6
  libxkbcommon
  xorg.libX11
  fontconfig
  glib
  freetype
  zstd
  dbus
  xcb-util-cursor
  wayland

  # games
  crawl
  
  # browsing
  google-chrome
  wofi

  # networking
  wireguard-tools
  wireshark
  tshark
  networkmanagerapplet
  networkmanager-sstp
  ppp

  # media
  v4l-utils
  mpv
  kitty
  pipewire
  brightnessctl
  pavucontrol

  # ui
  nwg-look
  fira-code
  fira-code-symbols
  font-awesome
  hyprlock

  # authentication
  pam_u2f
  kwallet-pam
  libu2f-host
  libu2f-server
  hyprpolkitagent
  bitwarden-desktop

  ];

  programs.steam.enable = true;
  programs.tmux = {
    enable = true;
    shortcut = "b";
    escapeTime = 0;
    secureSocket = false;
    extraConfig = "
set-option -g mouse on
set -ga terminal-overrides \",xterm-256color:Tc\"
    ";
  };
}
