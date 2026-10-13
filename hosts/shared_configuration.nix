{
  pkgs,
  inputs,
  config,
  ...
}:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 5;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  # allow localsend & flask
  networking.firewall.allowedTCPPorts = [
    53317
    5000
  ];
  networking.firewall.allowedUDPPorts = [ 53317 ];
  # allow eduvpn
  networking.firewall.checkReversePath = "loose";

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = false;

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.bileam = ../users/bileam.nix;
  home-manager.extraSpecialArgs = { inherit inputs; };
  # environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];

  environment.sessionVariables.GTK_USE_PORTAL = "1";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
  };

  # Configure console keymap
  console.keyMap = "us";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # zerotier
  services.zerotierone.enable = true;

  # store optimization and garbage collection
  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.bileam = {
    isNormalUser = true;
    description = "Bileam Scheuvens";
    extraGroups = [
      "syncthing"
      "networkmanager"
      "wheel"
      "i2c"
      "video"
      "adbusers"
      "docker"
    ];
  };
  security.sudo.wheelNeedsPassword = false;

  # Install firefox.
  programs.firefox.enable = true;

  # gnupg
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-tty;
    enableSSHSupport = true;
  };

  # enable docker
  virtualisation.docker.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # allow insecure electron
  nixpkgs.config.permittedInsecurePackages = [
    "NetworkManager-sstp-gnome-1.3.2"
  ];

  # direnv for cached shells
  programs.direnv.enable = true;

  # TODO figure out if this is necessary
  # binary caches
  nix.settings = {
    substituters = [
      "https://nix-community.cachix.org/"
      "https://hyprland.cachix.org/"
      "https://cache.nixos-cuda.org/"
      "https://cache.flox.dev"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
      "flox-cache-public-1:7F4OyH7ZCnFhcze3fJdfyXYLQw/aV7GEed86nQ7IsOs="
    ];
  };

  # Enable Flakes and new nix CLI
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # p2p sync
  services.syncthing = {
    enable = true;
    user = "bileam";
    configDir = "/home/bileam/.config/syncthing";
    openDefaultPorts = true;
    guiPasswordFile = config.sops.secrets.syncthing_pw.path;
    dataDir = "/home/bileam/share";
    settings = {
      gui.user = "bileam";
      devices = {
        "Athenai" = {
          id = "YGE4G62-MDK6IBE-AKSPY4V-E22RTI7-LMLT4EE-NMI7QAN-4RYIBET-LFO37AM";
        };
        "BooxA3" = {
          id = "KZ4MOMI-WMH4T25-537ZFGZ-EJNQE5Q-4NNPCHS-7SAPHHI-XUTQOHZ-DS4H5AE";
        };
        "Theseus" = {
          id = "BQJNJEN-3B2JNAN-HEA6FCG-M6GDSTI-7H4BL3E-77MTHAY-3VVNJUI-D5CLTQI";
        };
      };
      folders = {
        "dspls" = {
          path = "/home/bileam/code/dpsls";
          devices = [
            "Athenai"
            "Theseus"
          ];
        };
        "share" = {
          path = "/home/bileam/share/";
          devices = [
            "Athenai"
            "BooxA3"
            "Theseus"
          ];
        };
      };

    };
  };
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
