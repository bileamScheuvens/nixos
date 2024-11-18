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
  
  # utilities
  htop
  wget
  curl
  unzip
  zip
  powertop
  busybox
  fzf
  tldr
  bat
  eza
  zoxide
  ripgrep
  wl-clipboard

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
  
  # games
  crawl
  
  # browsing
  google-chrome

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

  # 2fa
  pam_u2f
  libu2f-host
  libu2f-server

  ];

  programs.steam.enable = true;
  programs.tmux = {
    enable = true;
    escapeTime = 0;
    extraConfig = "
set-option -g mouse on
set -ga terminal-overrides \",xterm-256color:Tc\"
    ";
  };
}
