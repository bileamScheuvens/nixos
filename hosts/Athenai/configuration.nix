# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../shared_configuration.nix
  ];

  # set hostname
  networking.hostName = "Athenai"; # Define your hostname.

  # Cryptsetup
  boot.initrd.systemd.enable = true;
  boot.initrd.luks = {
    devices = {
      root = {
        device = "/dev/disk/by-uuid/c82ab6ec-cc3d-46f1-ac62-3f4dba647079";
        preLVM = true;
        keyFileTimeout = 5;
      };
    };
  };



}
