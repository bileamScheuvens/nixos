{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixvim = {
      url = "path:nvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixvim, ... }@inputs: {
    # Please replace my-nixos with your hostname
    nixosConfigurations.Theseus = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        # Import the previous configuration.nix we used,
        # so the old configuration file still takes effect
        ./configuration.nix
        ./boot.nix
        ./packages.nix
        ./vim.nix
        ./bash.nix
        ./vpn.nix
        ./battery.nix
      ];
    };
  };
}
