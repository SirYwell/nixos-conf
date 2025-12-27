{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs-xr.url = "github:nix-community/nixpkgs-xr";
  };
  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, nixos-hardware, nixpkgs-xr, ... }:
  let
    system = "x86_64-linux";
    pkgsUnstable = import nixpkgs-unstable { system = "x86_64-linux"; config.allowUnfree = true; };
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
      specialArgs = { inherit pkgsUnstable; };
    };
    nixosConfigurations.notebook = nixpkgs.lib.nixosSystem {
      modules = [
        nixos-hardware.nixosModules.framework-amd-ai-300-series
        ./notebook.nix
	./configuration.nix
        ./desktop.nix
      ];
      specialArgs = { inherit pkgsUnstable; };
    };
  };
}
