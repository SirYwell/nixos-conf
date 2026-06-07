{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs-xr.url = "github:nix-community/nixpkgs-xr";
  };
  outputs = inputs@{ self, nixpkgs, nixos-hardware, nixpkgs-xr, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.tower = nixpkgs.lib.nixosSystem {
      modules = [
        ./tower.nix
        ./configuration.nix
	./desktop.nix
	./gaming.nix
	./vr.nix
	nixpkgs-xr.nixosModules.nixpkgs-xr
	./rtx2070super.nix
      ];
    };
    nixosConfigurations.notebook = nixpkgs.lib.nixosSystem {
      modules = [
        nixos-hardware.nixosModules.framework-amd-ai-300-series
        ./notebook.nix
	./configuration.nix
        ./desktop.nix
      ];
    };
  };
}
