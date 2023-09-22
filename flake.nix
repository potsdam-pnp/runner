{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";

  outputs = {self, nixpkgs }: {
    nixosConfigurations.runner = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [ ./networking.nix ./hardware-configuration.nix ./runner.nix {
        services.openssh.enable = true;
        users.users.root.openssh.authorizedKeys.keys = [
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDIGo1MuVZL1/FEM7eM8VQoyR5JWM1QwgqZgdFPn7Hi3XF0lihkPUh1Dn7L2DdNXIfXtqM5QhqK1AOl3BCV1xxRQfrHM65EOdA0F/u++8rdz9+2Vfj00oraWMJSo3wQXwmpNW0BzduqFCzG8CQs8lN59Q7tGpYgn78LHTQRuUAet74CFYedZus4yNqgVD1rXtJfNy4uGY5Rd3cpwQ9LjQJf8NfIaaTYwgZ/GndiRei0lPF1i51L5cogsFoqQzc0BSONHMh6fepd1DrbohG558uJasK1t4S2FH8f7bkBWbz1ZkwG80kGvfUFzL4scdx3LAktn7pS1PQRFmCZf2m/NMrJ+jROmowcZRgSxru+LN2+9Shnb4xUn3CBQ5c8yJMdBsugKUxisO+KRaOxcO8R5JdcotwxSQXpOvM6ySZnxroIWk+UJj1TmprHlnGL7UulPaOAFIkv2ms7pMWxBkZnIorWj+Hy4AmN8VnVQI1ZpPnGVCuN4bL4NV5/oM+bv/S0Oyk="
        ];
        nix.settings.experimental-features = [ "nix-command" "flakes" ];
      }];
    };
  };
}
