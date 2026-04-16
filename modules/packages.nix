{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    # version control
    git
    git-lfs
    gh
    stow

    # social
    discord
    teams-for-linux
    signal-desktop
    telegram-desktop
    element-desktop
    thunderbird
    slack
    dunst

    # productivity
    kitty
    obsidian
    mako
    anki-bin
    presenterm
    libreoffice
    starship
    marp-cli

    # compression
    zip
    zstd

    # utilities
    htop
    wget
    curl
    unzip
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
    nixfmt
    localsend
    fd
    vimPlugins.kitty-scrollback-nvim
    jq

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
    julia-bin
    python3
    poetry
    gcc
    libgcc
    gnumake
    cmake
    extra-cmake-modules
    universal-ctags
    libz
    stdenv.cc.cc.lib
    swig
    nodejs
    pre-commit

    # deps for PyQt6
    libxkbcommon
    libX11
    fontconfig
    glib
    freetype
    dbus
    xcb-util-cursor
    wayland

    # games
    crawl
    vimgolf

    # browsing
    fuzzel

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
    keyutils
    bitwarden-desktop
    bitwarden-cli
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
