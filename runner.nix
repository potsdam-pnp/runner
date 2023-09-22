{ pkgs, ... }: {
  services.github-runner = {
    enable = true;
    url = "https://github.com/potsdam-pnp";
    tokenFile = builtins.toFile "tok" "AACWRH3HQMTGR6P5TPAXRVLFBVSNA"; 
    nodeRuntimes = [ "node16" "node20" ];
  };
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.permittedInsecurePackages = [
    "nodejs-16.20.2"
  ];
}