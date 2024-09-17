{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
  # version control
  git
  git-lfs

  # social
  discord
  teams-for-linux
  signal-desktop
  
  # utilities
  htop
  wget
  curl
  unzip
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
  
  # development
  vscode
  vim
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
  inputs.nixvim.packages."${system}".default
  
  # games
  crawl
  
  # browsing
  google-chrome

  # networking
  wireguard-tools
  wireshark
  tshark

  # media
  v4l-utils
  mpv

  # 2fa
  pam_u2f
  libu2f-host
  libu2f-server

  ];

  programs.steam.enable = true;
  programs.tmux = {
    enable = true;
    extraConfig = "
set -ga terminal-overrides \",xterm-256color:Tc\"
    ";
  };
}
