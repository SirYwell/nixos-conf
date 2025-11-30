{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };
  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, ... }:
  let
    system = "x86_64-linux";
    pkgsUnstable = import nixpkgs-unstable { system = "x86_64-linux"; config.allowUnfree = true; };
  in {
    nixosConfigurations.tower = nixpkgs.lib.nixosSystem {
      modules = [
        ./tower.nix
        ./configuration.nix
	./desktop.nix
      ];
      specialArgs = { inherit pkgsUnstable; };
    };
    nixosConfigurations.notebook = nixpkgs.lib.nixosSystem {
      modules = [
        ./notebook.nix
	./configuration.nix
        ./desktop.nix
      ];
      specialArgs = { inherit pkgsUnstable; };
    };
  };
}
