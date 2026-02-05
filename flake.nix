{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim = {
      url = "path:nixvim-config";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixvim, ... }@inputs: {
    nixosConfigurations.Theseus = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        # import host specific config
        ./hosts/Theseus/configuration.nix


        # import modules
        ./modules/bash.nix
        ./modules/battery.nix
        ./modules/boot.nix
        ./modules/hyprland.nix
        ./modules/packages.nix
        ./modules/vpn.nix
        ./modules/keyboard.nix
        ./modules/qutebrowser.nix
      ];
    };
    nixosConfigurations.Athenai = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        # import host specific config
        ./hosts/Athenai/configuration.nix


        # import modules
        ./modules/bash.nix
        ./modules/boot.nix
        ./modules/hyprland.nix
        ./modules/packages.nix
        ./modules/vpn.nix
        ./modules/nvidia.nix
        ./modules/keyboard.nix
        ./modules/qutebrowser.nix
      ];
    };
  };
}
