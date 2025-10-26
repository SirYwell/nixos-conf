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
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [ 
        ./configuration.nix
	./desktop.nix
      ];
      specialArgs = { inherit pkgsUnstable; };
    };
  };
}
