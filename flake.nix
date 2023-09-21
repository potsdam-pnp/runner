{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";

  outputs = {self, nixpkgs }: {
    nixosConfigurations.runner = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [ ./networking.nix ./hardware-configuration.nix ./runner.nix ];
    };
  };
}
