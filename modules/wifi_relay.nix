{
  config,
  lib,
  pkgs,
  ...
}:

{
  networking.bridges = lib.mkForce { };

  networking.networkmanager.unmanaged = [ "wlo1" ];
  networking.wireless.enable = lib.mkForce false;

  networking.interfaces.wlo1.ipv4.addresses = [
    {
      address = "192.168.50.1";
      prefixLength = 24;
    }
  ];

  services.dnsmasq = {
    enable = true;

    settings = {
      interface = "wlo1";
      bind-interfaces = true;

      dhcp-range = [
        "192.168.50.100,192.168.50.200,255.255.255.0,12h"
      ];

      dhcp-option = [
        "option:router,192.168.50.1"
        "option:dns-server,192.168.50.1"
      ];
    };
  };

  services.hostapd = {
    enable = true;

    radios.wlo1.networks.wlo1 = {
      ssid = "Blaues Haus";

      authentication = {
        mode = "wpa2-sha256";
        wpaPasswordFile = config.sops.secrets.wifi_relay.path;
      };
    };
  };

  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
  };

  networking.nat = {
    enable = true;
    externalInterface = "enp4s0";
    internalInterfaces = [ "wlo1" ];
  };

  networking.firewall = {
    enable = true;

    # 53: DNS, 67: DHCP
    allowedUDPPorts = [
      53
      67
    ];

    allowedTCPPorts = [
      53
    ];

    extraCommands = ''
      iptables -A FORWARD -i wlo1 -o enp4s0 -j ACCEPT
      iptables -A FORWARD -i enp4s0 -o wlo1 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
    '';
  };
}
