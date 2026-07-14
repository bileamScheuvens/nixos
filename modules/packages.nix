{
  pkgs,
  inputs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    # version control
    git
    git-lfs
    gh
    stow
    nextcloud-client

    # nix utils
    comma
    nix-index
    nix-init
    nixfmt
    nurl

    # social
    discord
    dunst
    element-desktop
    signal-desktop
    slack
    teams-for-linux
    telegram-desktop
    thunderbird

    # productivity
    anki-bin
    khal
    kitty
    libreoffice
    mako
    marp-cli
    obsidian
    presenterm
    starship
    vim-hypr-nav

    # compression
    zip
    zstd

    # utilities
    bibtool
    busybox
    cliphist
    curl
    fd
    ffmpeg
    fzf
    graphviz
    grim
    htop
    inputs.doi2bib.packages."${stdenv.hostPlatform.system}".native
    jq
    libsecret
    localsend
    ripgrep
    slurp
    tealdeer
    tokei
    trash-cli
    unzip
    vimPlugins.kitty-scrollback-nvim
    wget
    wl-clipboard
    zoxide

    # text editing
    vscode
    vim
    inputs.nixvim.packages."${stdenv.hostPlatform.system}".default
    typst
    pandoc
    zotero
    mermaid-cli
    texliveFull
    xdg-desktop-portal-termfilechooser

    # development
    cmake
    gcc
    gnumake
    julia-bin
    libgcc
    libz
    nodejs
    poetry
    pre-commit
    python3
    stdenv.cc.cc.lib
    swig
    universal-ctags

    # games
    # crawl
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
    brightnessctl
    ddcutil
    mpv
    muffon
    pavucontrol
    python314Packages.pygments
    termusic
    v4l-utils

    # creative
    # affinity-v3
    inkscape

    # ui
    nwg-look
    fira-code
    fira-code-symbols

    # authentication
    bitwarden-cli
    bitwarden-desktop
    hyprpolkitagent
    keyutils
    libu2f-host
    libu2f-server
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
