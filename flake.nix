{
 description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "path:nixvim-config";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri-flake.url = "github:sodiboo/niri-flake";
  };

  outputs = { self, nixpkgs, nixvim, niri-flake, home-manager, ... }@inputs: {
    nixosConfigurations.Theseus = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        # import host specific config
        ./hosts/Theseus/configuration.nix
        home-manager.nixosModules.home-manager


        # import modules
        ./modules/bash.nix
        ./modules/battery.nix
        ./modules/boot.nix
        ./modules/hyprland.nix
        ./modules/packages.nix
        ./modules/vpn.nix
        ./modules/keyboard.nix
        ./modules/qutebrowser.nix
        ./modules/fonts.nix
      ];
    };
    nixosConfigurations.Athenai = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        # import host specific config
        ./hosts/Athenai/configuration.nix
        home-manager.nixosModules.home-manager


        # import modules
        ./modules/bash.nix
        ./modules/boot.nix
        ./modules/packages.nix
        ./modules/vpn.nix
        ./modules/nvidia.nix
        ./modules/keyboard.nix
        ./modules/qutebrowser.nix
        ./modules/hyprland.nix
        ./modules/fonts.nix
        ./modules/obs.nix
      ];
    };
  };
}
