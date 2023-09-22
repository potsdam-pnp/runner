{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
  inputs.nixpkgs-unstable.url = "github:NixOS/nixpkgs";

  outputs = {self, nixpkgs, nixpkgs-unstable }: {
    nixosConfigurations.runner = nixpkgs-unstable.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [ ./configuration.nix ./runner.nix ]
    };
  };
}
