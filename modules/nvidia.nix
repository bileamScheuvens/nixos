{ config, ... }:

{
  hardware.graphics.enable = true;

  # boot.initrd.kernelModules = [ "195" ];
  boot.initrd.kernelModules = [ "nvidia" "nvidia_drm" "nvidia_uvm" "nvidia_modeset"];

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    powerManagement.enable = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}

