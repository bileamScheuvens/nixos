{ config, inputs, ... }:
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    age.keyFile = "${config.users.users.bileam.home}/.config/sops/age/keys.txt";
    secrets.wifi_relay = { };
  };
}
