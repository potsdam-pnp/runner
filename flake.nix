{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
  inputs.nixpkgs-unstable.url = "github:NixOS/nixpkgs";

  outputs = {self, nixpkgs, nixpkgs-unstable }: {
    nixosConfigurations.runner = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [ ./configuration.nix ./runner.nix {
        nix.settings.experimental-features = [ "nix-command" "flakes" ];
        nixpkgs.config.permittedInsecurePackages = [
          "nodejs-16.20.2"
        ];
        services.github-runner.package = nixpkgs-unstable.legacyPackages.x86_64-linux.github-runner;
      }];
    };
  };
}
