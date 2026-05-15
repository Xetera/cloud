{ pkgs, ... }:
{
  dotenv.enable = true;

  packages = with pkgs; [
    kubectl
    fluxcd
    cilium-cli
    k9s
    opentofu
    pluto
  ];
}
