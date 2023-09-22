{ pkgs, ... }: {
  services.github-runner = {
    enable = true;
    url = "https://github.com/potsdam-pnp";
    tokenFile = builtins.toFile "tok" "AACWRHY5QB7EWOSUN5DHSQTFBWHXA"; 
    nodeRuntimes = [ "node16" "node20" ];
  };
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [ "https://potsdam-pnp.cachix.org/" ];
    trusted-public-keys = [ "potsdam-pnp.cachix.org-1:ZbQQiYz7KI9iZLOwECW6ErfJLFowbVOrNUF7PXJGLhw=" ];
  };
  nixpkgs.config.permittedInsecurePackages = [
    "nodejs-16.20.2"
  ];
}