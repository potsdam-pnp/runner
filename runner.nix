{ pkgs, ... }: {
  services.github-runner = {
    enable = true;
    url = "https://github.com/potsdam-pnp";
    tokenFile = "${pkgs.writeText "tok" "AACWRHZPW5QL7MYIN2RSD7TFBTGMQ"}"; 
  };
}