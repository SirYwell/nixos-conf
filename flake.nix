{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs-xr.url = "github:nix-community/nixpkgs-xr";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs@{ self, nixpkgs, nixos-hardware, nixpkgs-xr, nix-darwin, ... }: {
    nixosConfigurations.tower = nixpkgs.lib.nixosSystem {
      modules = [
        ./tower.nix
        ./configuration.nix
        ./shells.nix
        ./neovim.nix
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
        ./shells.nix
        ./neovim.nix
        ./desktop.nix
      ];
    };
    darwinConfigurations.macbook = nix-darwin.lib.darwinSystem {
      modules = [
        ./darwin.nix
        ./shells.nix
        ./neovim.nix
      ];
    };
  };
}
