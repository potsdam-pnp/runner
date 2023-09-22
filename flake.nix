{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";

  outputs = {self, nixpkgs }: {
    nixosConfigurations.runner = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [ ./configuration.nix ./runner.nix {
        nix.settings.experimental-features = [ "nix-command" "flakes" ];
        nixpkgs.config.permittedInsecurePackages = [
          "nodejs-16.20.2"
        ];
      }];
    };
  };
}
