{ pkgs, ... }:

{
  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "10.5.2.3/24" ];
      privateKey = "OA0X11qTKv3UfwhwLaN6RBS4vVdL4eFn7hLz8UqmHVE=";
      mtu = 1200;

      peers = [
        {
          publicKey = "drkpFfPF8pbwSMaxGisseozLXSliH6LyD7z6HhgeYXs=";
          allowedIPs = [ "10.5.2.0/24" "10.5.1.0/24" ];
          endpoint = "45.129.182.28:51201";
          persistentKeepalive = 10;
        }
      ];
    };
  };
}
