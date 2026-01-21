{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
  # version control
  git
  git-lfs
  stow

  # social
  discord
  teams-for-linux
  signal-desktop
  telegram-desktop
  element-desktop
  thunderbird
  slack

  # productivity
  kitty
  obsidian
  mako
  anki-bin
  presenterm
  libreoffice
  starship

  
  # utilities
  htop
  wget
  curl
  unzip
  zip
  grim
  slurp
  busybox
  fzf
  tealdeer
  zoxide
  ripgrep
  wl-clipboard
  cliphist
  libsecret
  ffmpeg
  graphviz
  tokei
  nix-index
  localsend
  vimPlugins.kitty-scrollback-nvim

  # framework specific
  linuxKernel.packages.linux_xanmod_latest.framework-laptop-kmod
  
  # text editing
  vscode
  vim
  inputs.nixvim.packages."${stdenv.hostPlatform.system}".default
  typst
  pandoc
  zotero
  mermaid-cli
  

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
  tree-sitter
  nodejs

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
  vimgolf
  
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
  eduvpn-client

  # media
  v4l-utils
  mpv
  pipewire
  brightnessctl
  pavucontrol
  muffon
  ddcutil

  # ui
  nwg-look
  fira-code
  fira-code-symbols

  # authentication
  libu2f-host
  libu2f-server
  hyprpolkitagent
  bitwarden-desktop
  tuigreet

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
