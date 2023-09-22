{ pkgs, ... }: {
  services.github-runner = {
    enable = true;
    url = "https://github.com/potsdam-pnp";
    tokenFile = builtins.toFile "tok" "AACWRH3HQMTGR6P5TPAXRVLFBVSNA"; 
  };
}