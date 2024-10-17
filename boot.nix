{ config, pkgs, ...}:

{
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  # 2fa
  security.pam = {
    u2f.settings = {
      enable = true;
      control = "sufficient";
      cue = true;
    };
    services = {
      sddm = {
        u2fAuth = true;
        nodelay = true;
      };
      login.u2fAuth = true;
      sudo.u2fAuth = true;
    };
  };
  services.udev.extraRules = ''
    ACTION=="remove", \
      ENV{ID_BUS}=="usb",\
      ENV{ID_MODEL_ID}=="fc25",\
      ENV{ID_VENDOR_ID}=="1ea8",\
      RUN+="${pkgs.systemd}/bin/loginctl lock-sessions"
  '';

  environment.variables = rec {
    VIMINIT = "source ~/dotfiles/.vimrc";    
  };
  # fingerprint sensor. Disabled as it causes massive login lag for some reason
  # services.fprintd.enable = true;
  # remapping caps to esc
  services.interception-tools =
  let
    itools = pkgs.interception-tools;
    itools-caps = pkgs.interception-tools-plugins.caps2esc;
  in
  {
    enable = true;
    plugins = [ itools-caps ];
    # requires explicit paths: https://github.com/NixOS/nixpkgs/issues/126681
    udevmonConfig = pkgs.lib.mkDefault ''
      - JOB: "${itools}/bin/intercept -g $DEVNODE | ${itools-caps}/bin/caps2esc -m 1 | ${itools}/bin/uinput -d $DEVNODE"
        DEVICE:
          EVENTS:
            EV_KEY: [KEY_CAPSLOCK, KEY_ESC]
    '';
  };
}
